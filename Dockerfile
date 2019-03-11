#need latest docker for this to work.
FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 5000
EXPOSE 433

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["jtperkins.info.csproj", "./"]
RUN dotnet restore "./jtperkins.info.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "./jtperkins.info.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "./jtperkins.info.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "./jtperkins.info.dll"]