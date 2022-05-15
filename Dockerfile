# Builder image
FROM node:slim AS development
LABEL stage=builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build microservice1 # Building backend
RUN npm run build frontend      # Building frontend


# Prod image
FROM node:12.19.0-alpine3.9 as microservice1
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /app
COPY --from=development /app/dist/apps/microservice1/package.json .
RUN npm install --only=production
COPY --from=development /app/dist/apps/microservice1 .

RUN echo "---------- Files copied ---------- " 
RUN ls -sail
CMD ["node", "main"]


# Stage 3: Build frontend app
FROM nginx:latest as frontend
COPY --from=development /app/dist/apps/frontend /usr/share/nginx/html
EXPOSE 80