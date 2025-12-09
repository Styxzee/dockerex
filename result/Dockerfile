FROM node:18-slim
LABEL maintainer="Guyomardkylian@gmail.com"
LABEL description="Application de résultats"
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production && \
    npm cache clean --force
COPY . .
RUN chown -R node:node /app
USER node
EXPOSE 8888
ENV DB_HOST=db
ENV DB_USER=postgres
ENV DB_PASSWORD=postgres
ENV DB_NAME=postgres
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "require('http').get('http://localhost:8888', (r) => {process.exit(r.statusCode === 200 ? 0 : 1);})" || exit 1
CMD ["npm", "start"]
