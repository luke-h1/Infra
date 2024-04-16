package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/cloudwatchlogs"
	"github.com/aws/aws-sdk-go-v2/service/resourcegroupstaggingapi"
	"github.com/aws/aws-sdk-go-v2/service/resourcegroupstaggingapi/types"
)

const (
    duration   = 24 * time.Hour
    timeFormat = "2006-01-02"
)

var (
    bucket = os.Getenv("BUCKET")
    client *cloudwatchlogs.Client
    taggingClient *resourcegroupstaggingapi.Client
)

func init() {
    cfg, err := config.LoadDefaultConfig(context.Background())
    if err != nil {
        log.Fatalf("Failed to load config: %v", err)
    }

    client = cloudwatchlogs.NewFromConfig(cfg)
    taggingClient = resourcegroupstaggingapi.NewFromConfig(cfg)
}

func getLogGroupsTaggedWithS3Export(ctx context.Context) ([]string, error) {
    input := &resourcegroupstaggingapi.GetResourcesInput{
        TagFilters: []types.TagFilter{
            {
                Key:    aws.String("s3Export"),
            },
        },
        ResourceTypeFilters: []string{"logs:log-group"},
    }

    output, err := taggingClient.GetResources(ctx, input)
    if err != nil {
        return nil, fmt.Errorf("error getting resources: %v", err)
    }

    var logGroups []string
    for _, resourceTagMapping := range output.ResourceTagMappingList {
        logGroups = append(logGroups, *resourceTagMapping.ResourceARN)
    }

    return logGroups, nil
}

func triggerExport(ctx context.Context, event events.CloudWatchEvent) error {
    endTime := event.Time.Truncate(duration)
    startTime := endTime.Add(-duration)

    logGroups, err := getLogGroupsTaggedWithS3Export(ctx)
    if err != nil {
        return fmt.Errorf("error getting log groups: %v", err)
    }

    for _, logGroup := range logGroups {
        prefix := fmt.Sprintf("%s/%s", strings.TrimLeft(logGroup, "/"), startTime.Format(timeFormat))
        from := startTime.UnixMilli()
        to := endTime.UnixMilli()
        input := &cloudwatchlogs.CreateExportTaskInput{
            LogGroupName:       &logGroup,
            Destination:        &bucket,
            DestinationPrefix:  &prefix,
            From:               &from,
            To:                 &to,
        }

        output, err := client.CreateExportTask(ctx, input)
        if err != nil {
            return fmt.Errorf("error creating export task: %v", err)
        }

        log.Printf("Export task created: %s", *output.TaskId)
    }

    return nil
}

func main() {
    lambda.Start(triggerExport)
}