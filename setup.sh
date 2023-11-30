#!/bin/bash

# Perform setup tasks
cd /app/rasaengine
rasa init --no-prompt

# Run the main application
exec rasa run --enable-api -m models --cors "*" --debug
