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
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Serve step
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

