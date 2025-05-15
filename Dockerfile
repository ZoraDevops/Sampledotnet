# Use the official .NET SDK image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

# Install essential tools: zip, curl, docker CLI
RUN apt-get update && \
    apt-get install -y \
    zip \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    software-properties-common

# Install Docker CLI
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Install dotnet-sonarscanner tool globally
RUN dotnet tool install --global dotnet-sonarscanner

# Make sure dotnet tools are available in PATH
ENV PATH="${PATH}:/root/.dotnet/tools"

# Create working directory
WORKDIR /app

# Default command (optional)
CMD ["bash"]
