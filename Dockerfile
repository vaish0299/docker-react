#Multi-step docker file
#creating one container
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#using the imp things we want from the container created above
#due to this way of creating our size is smaller
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html