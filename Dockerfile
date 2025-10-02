FROM python:3.13-slim

WORKDIR /app

# Install git and FFmpeg
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        ffmpeg \
        libsm6 \
        libxext6 \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Install 'uv' if you meant 'uvicorn', otherwise just upgrade pip
RUN pip install --no-cache-dir --upgrade pip uvicorn

# Copy project files
COPY . .

# Install your package in editable mode
RUN pip install --no-cache-dir -e .

# Start your application (replace with your actual command)
CMD ["start"]
