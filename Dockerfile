
# Stage 2: Build the final image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app


# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt


# Copy the rest of the application
COPY . /app


# Set entrypoint for interactive shell
ENTRYPOINT ["rasa"]



# Expose the ports needed by your services
EXPOSE 8000 5005 5055

# Start the Rasa server
CMD []