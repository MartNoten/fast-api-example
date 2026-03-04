# Use official Python slim image (3.12; 3.14 may not be available yet on Docker Hub)
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY main.py .

# Expose port (default 8000; override with PORT env in orchestration)
EXPOSE 8000

# Run uvicorn; use PORT env if set (e.g. Heroku), else 8000
ENV PORT=8000
CMD uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}
