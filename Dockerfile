FROM node:lts-alpine
ENV PORT=8000
RUN mkdir -p /app
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . /app
RUN mkdir -p --mode=0755 /usr/share/keyrings
RUN curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
RUN mkdir /etc/apt
RUN mkdir /etc/apt/sources.list.d
RUN echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | tee /etc/apt/sources.list.d/cloudflared.list
# RUN echo "search sharon.ns.cloudflare.com" >> /etc/resolv.conf
# RUN echo "grant.ns.cloudflare.com" >> /etc/resolv.conf
# RUN apt-get update && apt-get install cloudflared
# cloudflared service install eyJhIjoiYWViYTM5YWQ0MmRiMzJhOWJjYzQ3NTA1OTkzZTMwZDUiLCJ0IjoiN2I3MTY1MWItYTdjNC00YWEwLWJjY2QtNTQzZWE4M2I1ZGNiIiwicyI6Ik1ETTROelV3TmpndE16UmpaUzAwWXpNeExUbGlPVGt0Wm1VeE1UaGpZamt6TUdSaiJ9
CMD ["node", "app.js"]
