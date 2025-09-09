FROM node:lts-alpine
ENV PORT=8000
RUN mkdir -p /app
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . /app
CMD ["node", "app.js"]
