# Base image
FROM node:18-alpine AS builder 

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

#  Build ARG for environment spec 
ARG ENV=dev
RUN npm run build --ENV=$ENV

FROM node:18-alpine
WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 3000