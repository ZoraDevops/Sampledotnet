FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY ./source/published .
EXPOSE 80
ENTRYPOINT ["dotnet", "SampleDevOps.dll"]
