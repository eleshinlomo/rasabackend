# Stage 2: Build the final image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the rest of the application
COPY . /app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install virtualenv && \
    virtualenv venv && \
    . venv/bin/activate && \
    pip install -r requirements.txt

# Set entrypoint for interactive shell
ENTRYPOINT ["rasa"]

# Expose the ports needed by your services
EXPOSE 8000 5005 5055


# Run 'rasa init' inside the 'rasaengine' folder
RUN cd /app/rasaengine \
    && rasa init --no-prompt
