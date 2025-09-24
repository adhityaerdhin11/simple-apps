#Diambil dari docker hub
FROM node:18.20.8-slim
#Menambah folder
WORKDIR /app
COPY . /app/
RUN npm install
#Menunjukkan Aplikasi port 3000
EXPOSE 3000
CMD [ "npm start" ]