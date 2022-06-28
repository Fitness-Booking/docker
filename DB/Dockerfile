FROM alpine as source
RUN apk add git
RUN git clone https://github.com/Fitness-Booking/database.git

FROM mcr.microsoft.com/mssql/server:2022-latest
WORKDIR /usr/src/app

COPY . /usr/src/app
COPY --from=source /database /usr/src/app/database

ENV SA_PASSWORD password123!
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express


EXPOSE 1433

CMD /bin/bash ./entrypoint.sh
