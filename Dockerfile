FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Create jenkins user and group (inside the container)
RUN addgroup --system jenkins && adduser --system --ingroup jenkins jenkins

WORKDIR /app
COPY published/ ./

# Switch to jenkins user
USER jenkins

EXPOSE 9090
ENTRYPOINT ["dotnet", "SampleDevOps.dll"]
