#!/bin/bash

# somtimes due to issue with zoom not detecting mic, this command can be used to fix it

sudo kill -9 `ps aux | grep 'coreaudiod[a-z]' | awk '{print $1}'`
