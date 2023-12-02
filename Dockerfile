# Use the official Rasa base image
FROM rasa/rasa:3.6.14-full

# Set the working directory inside the container
WORKDIR /app

# Copy the local Rasa project files into the container
COPY . /app

EXPOSE 8000 5005 5055

# For example, if you have additional Python dependencies, you can use requirements.txt
COPY requirements.txt /app/

USER root

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt



ENTRYPOINT ["rasa"]

CMD ["run", "--enable-api", "-m", "model", "--cors", "*", "--debug"]
