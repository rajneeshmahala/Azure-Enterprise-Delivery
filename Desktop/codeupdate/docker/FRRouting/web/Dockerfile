# web/Dockerfile
FROM python:3.9-slim

WORKDIR /app

# Install Flask or any other required packages
RUN pip install flask

# Copy the application code into the container
COPY app.py .

# Expose port 9000
EXPOSE 9000

# Command to run the application
CMD ["python", "app.py"]
