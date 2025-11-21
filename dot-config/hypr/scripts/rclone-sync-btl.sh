#!/bin/bash

while uwsm-app -- inotifywait -r -e modify,create,delete /home/pampam/Documents/UTH/MachineLearning/tests/group-project-finals; do
    uwsm-app -- rclone sync /home/pampam/Documents/UTH/MachineLearning/tests/group-project-finals ngomkhang132:BTL_DEEP_LEARNING/
done
