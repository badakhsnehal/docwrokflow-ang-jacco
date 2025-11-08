# Use Node 18
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json first to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
