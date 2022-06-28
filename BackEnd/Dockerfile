FROM alpine as source
RUN apk add --no-cache git
RUN git clone https://github.com/Fitness-Booking/backend.git


FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src

COPY --from=source /backend /backend

RUN dotnet restore "/backend/FitnessBooking.Api/FitnessBooking.Api.csproj"
COPY . .
WORKDIR "/backend/FitnessBooking.Api"
RUN dotnet build "FitnessBooking.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "FitnessBooking.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "FitnessBooking.Api.dll"]