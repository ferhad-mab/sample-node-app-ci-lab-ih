#<--- week4 lab3 dockerfile--->
# # Define a base layer
# FROM node:22-alpine

# LABEL author=saurabh

# # Set the working directory
# WORKDIR /app

# # Copy the package.json and package-lock.json files
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code
# COPY . .

# # Expose the application port
# EXPOSE 3000

# # Start the application
# CMD ["npm", "start"]

# <---week4 lab4 dockerfile --->
# Define a base layer
# Build step
# Use Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
