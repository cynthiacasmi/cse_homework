#!/bin/bash

# Install app.js dependency for Node.js
npm install express

# Add cloudflare gpg key
mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

# Add this repo to your apt repositories
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | tee /etc/apt/sources.list.d/cloudflared.list

# install cloudflared
apt-get update && apt-get install cloudflared

cloudflared service install eyJhIjoiYWViYTM5YWQ0MmRiMzJhOWJjYzQ3NTA1OTkzZTMwZDUiLCJ0IjoiYjE0ODlmYzYtMDVhNC00ZDRhLTgzNjEtNzgzNTU1M2NlZTJiIiwicyI6Ik5qUTJObUl4TW1RdE5EWmhZUzAwWldJeExUZzJOV1V0WWpGak56bGtOakJtTVRVMSJ9
