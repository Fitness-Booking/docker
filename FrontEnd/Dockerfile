FROM alpine as source
RUN apk add git
RUN git clone https://github.com/Fitness-Booking/frontend.git

FROM node:14.2.0-alpine3.11 as build
WORKDIR /usr/src/app
COPY --from=source /frontend ./
RUN npm install
RUN npm run build

FROM nginx as runtime
COPY --from=build /usr/src/app/dist/fromt /usr/share/nginx/html