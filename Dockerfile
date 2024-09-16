# Use the official Node.js image as a base
FROM node:18-alpine3.16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json first
# This allows Docker to cache the node_modules layer if dependencies don't change
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
