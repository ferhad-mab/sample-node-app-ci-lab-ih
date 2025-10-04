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
# 1. Build stage
FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# If you have a build step (e.g., React/Next client): npm run build || true
RUN npm run build || true

# 2. Runtime stage
FROM node:22-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app ./
EXPOSE 3000
CMD ["npm", "start"]