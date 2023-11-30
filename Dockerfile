# Stage 2: Build the final image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the rest of the application
COPY . /app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy setup script
COPY setup.sh /app/setup.sh

# Make the script executable
RUN chmod +x /app/setup.sh

# Set entrypoint to the setup script
ENTRYPOINT ["/app/setup.sh"]

# Expose the ports needed by your services
EXPOSE 8000 5005 5055
