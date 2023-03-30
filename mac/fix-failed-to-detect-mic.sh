#!/bin/bash

sudo kill -9 `ps aux | grep 'coreaudiod[a-z]' | awk '{print $1}'`
