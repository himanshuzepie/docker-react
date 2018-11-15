FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#will automatically start nginx server
#no need of npm image,etc. all gaswe need is app/build directory for prod