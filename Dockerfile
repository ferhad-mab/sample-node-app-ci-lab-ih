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
# Use official Node image
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# Copy rest of the app source
COPY . .

# Build step if needed (optional)
# RUN npm run build

# Expose the port your app listens on
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
