FROM node:14.7.0-alpine3.11 as builder

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

RUN npm run build


# phase 2: create nginx image
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html


