# syntax docker/dockerfile:1

FROM node:21.6

#change the working dir on the image to /app
WORKDIR /app

RUN mkdir -p /app/data

COPY ["package.json", "./"]

RUN npm install

#copying /src --> /app (on docker image)
COPY ./src .

# This is for pulling secrets from GitHub eventually
# ARG DB_NAME
# ARG DB_USER
# ARG DB_PASSWORD

# ENV DB_NAME $DB_NAME
# ENV DB_USER $DB_USER
# ENV DB_PASSWORD $DB_PASSWORD

EXPOSE 80

CMD [ "node", "app.js" ]
