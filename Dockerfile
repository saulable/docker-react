FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase to use nginx
FROM nginx
#copy from a differernt phase
COPY --from=builder /app/build /usr/share/nginx/html
#don't need a run command, nginx cmd starts automatically
