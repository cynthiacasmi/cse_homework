#!/bin/bash

# Install app.js dependency for Node.js
npm install express

git clone https://github.com/cloudflare/cloudflared.git
cd cloudflared
make cloudflared
go install github.com/cloudflare/cloudflared/cmd/cloudflared
