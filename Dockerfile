#need latest docker for this to work.
FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 7000
EXPOSE 7001

# Copy csproj and restore as distinct layers
FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["jtperkins.info.csproj", "./"]
RUN dotnet restore "./jtperkins.info.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "./jtperkins.info.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "./jtperkins.info.csproj" -c Release -o /app

# Build runtime image
FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "jtperkins.info.dll"]