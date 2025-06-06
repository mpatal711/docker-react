FROM node:lts-alpine AS builder

WORKDIR '/app'
COPY  package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

#no need for command because default startup is nginx
