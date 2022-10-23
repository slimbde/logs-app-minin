FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .    

ENV PORT 3000

EXPOSE ${PORT}

VOLUME [ "/app/data" ]

CMD ["node", "app.js"]