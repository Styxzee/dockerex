FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY Worker.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app/publish --no-restore --self-contained false
FROM mcr.microsoft.com/dotnet/runtime:7.0
LABEL maintainer="Guyomardkylian@gmail.com"
LABEL description="Worker pour traiter les votes"
RUN useradd -m -u 1000 workeruser
WORKDIR /app
COPY --from=build /app/publish .
RUN chown -R workeruser:workeruser /app
USER workeruser
ENV DB_HOST=db
ENV DB_USER=postgres
ENV DB_PASSWORD=postgres
ENV DB_NAME=postgres
ENV REDIS_HOST=redis
CMD ["dotnet", "Worker.dll"]