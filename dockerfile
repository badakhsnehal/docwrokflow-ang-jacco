# Stage 1: Build
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build   # Optional for frontend build

# Stage 2: Run
FROM node:18-slim
WORKDIR /app
COPY --from=build /app .
ENV NODE_ENV=production
ARG BUILD_ID
ARG GIT_COMMIT
LABEL build_id=$BUILD_ID
LABEL git_commit=$GIT_COMMIT
EXPOSE 3000
CMD ["node", "app.js"]
