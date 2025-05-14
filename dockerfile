from node:alpine

workdir /usr/bin/app

run npm install -g pm2
run npm install express

copy . .

Expose 4000

cmd ["pm2-runtime", "app.js", "--name", "app-hello"]
