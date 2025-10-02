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

# Ensure ffmpeg is in PATH
ENV PATH="/usr/bin:${PATH}"

# Upgrade pip and install uvicorn (if needed)
RUN pip install --no-cache-dir --upgrade pip uvicorn

# Copy project files
COPY . .

# Install your package in editable mode
RUN pip install --no-cache-dir -e .

# Default command
CMD ["start"]
