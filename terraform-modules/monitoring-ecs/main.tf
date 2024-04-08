provider "aws" {
  region = "eu-west-2"
}

resource "aws_ecs_cluster" "grafana_cluster" {
  name = "grafana-cluster"
}


resource "aws_alb" "application_load_balancer" {
  name               = "graf-lb"
  load_balancer_type = "application"
  subnets = [
    "${aws_default_subnet.application_subnet_a.id}",
    "${aws_default_subnet.application_subnet_b.id}",
    "${aws_default_subnet.application_subnet_c.id}"
  ]
  security_groups = ["${aws_security_group.application_load_balancer_security_group.id}"]
}

resource "aws_default_vpc" "default_vpc" {
}

resource "aws_lb_target_group" "application_target_group" {
  name                          = "lb-graf"
  port                          = 80
  protocol                      = "HTTP"
  target_type                   = "ip"
  vpc_id                        = aws_default_vpc.default_vpc.id
  deregistration_delay          = 300
  load_balancing_algorithm_type = "least_outstanding_requests"


  health_check {
    matcher           = "200"
    path              = "/"
    interval          = 60
    timeout           = 30
    healthy_threshold = 3
  }

  stickiness {
    type            = "lb_cookie"
    enabled         = true
    cookie_duration = 3600
  }
}

resource "aws_security_group" "application_load_balancer_security_group" {
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Prometheus UI
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Grafana access on port 3000
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_listener" "web_http" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_target_group.arn
  }

  #   default_action {
  #     type = "redirect"

  #     redirect {
  #       port        = 443
  #       protocol    = "HTTPS"
  #       status_code = "HTTP_301"
  #     }
  #   }
}

resource "aws_ecs_task_definition" "grafana" {
  family                   = "grafana"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.lhowsam_task_execution_role.arn
  task_role_arn            = aws_iam_role.lhowsam_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "grafana"
      image     = "grafana/grafana:latest"
      cpu       = 256
      memory    = 512
      essential = true
      logConfiguration = {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-group" : "${aws_cloudwatch_log_group.lho_log_group.name}",
          "awslogs-region" : "eu-west-2",
          "awslogs-stream-prefix" : "graf"
        },
      }
      "portMappings" : [
        {
          "containerPort" : 3000,
          "hostPort" : 3000
        }
      ],
    },
  ])
}


resource "aws_default_subnet" "application_subnet_a" {
  availability_zone = "eu-west-2a"
}

resource "aws_default_subnet" "application_subnet_b" {
  availability_zone = "eu-west-2b"
}

resource "aws_default_subnet" "application_subnet_c" {
  availability_zone = "eu-west-2c"
}

resource "aws_ecs_service" "grafana" {
  name            = "grafana"
  cluster         = aws_ecs_cluster.grafana_cluster.id
  task_definition = aws_ecs_task_definition.grafana.arn
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.application_target_group.arn
    container_name   = aws_ecs_task_definition.grafana.family
    container_port   = 3000
  }

  triggers = {
    redeployment = timestamp()
  }


  network_configuration {
    subnets          = ["${aws_default_subnet.application_subnet_a.id}", "${aws_default_subnet.application_subnet_b.id}", "${aws_default_subnet.application_subnet_c.id}"]
    assign_public_ip = true
    security_groups  = ["${aws_security_group.application_service_security_group.id}"]
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }
}

resource "aws_security_group" "application_service_security_group" {
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.application_load_balancer_security_group.id}"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.application_load_balancer_security_group.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
