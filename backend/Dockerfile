FROM node:18
WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "production" ]; \
  then npm install --only=production; \
  else npm install; \
  fi
COPY . .
EXPOSE 8080
CMD ["npm", "run", "start"]