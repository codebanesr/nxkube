# Builder image
FROM node:slim AS development
LABEL stage=builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build microservice1



# Prod image
FROM node:12.19.0-alpine3.9 as production
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /app
COPY --from=development /app/dist/apps/microservice1/package.json .
RUN npm install --only=production
COPY --from=development /app/dist/apps/microservice1 .

RUN echo "---------- Files copied ---------- " 
RUN ls -sail
CMD ["node", "main"]

