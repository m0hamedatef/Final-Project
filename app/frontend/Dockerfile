FROM node:14-alpine

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the entire application code
COPY . .

# Set environment variable for PATH
ENV PATH /app/node_modules/.bin:$PATH

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
