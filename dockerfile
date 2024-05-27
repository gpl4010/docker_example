# Use the official Node.js 16 image
FROM node:16

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy application dependency manifest files to the container image
COPY package*.json ./

# Clear npm cache and set npm registry
RUN npm cache clean --force
RUN npm config set registry https://registry.npmjs.org/

# Install production dependencies
RUN npm install

# Copy local code to the container image
COPY . .

# Run the web service on container startup
CMD [ "node", "index.js" ]

# Expose the port the app runs on
EXPOSE 3000
