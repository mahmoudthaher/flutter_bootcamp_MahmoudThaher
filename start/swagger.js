const swaggerJsdoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");

const swaggerOptions = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "AdonisJS Swagger API",
      version: "1.0.0",
      description: "A sample API for AdonisJS with Swagger",
    },
    servers: [
      {
        url: "http://localhost:3333",
        description: "Development server",
      },
    ],
  },
  apis: ["./app/**/*.js"],
};

const swaggerSpec = swaggerJsdoc(swaggerOptions);

module.exports = (app) => {
  app.use(
    "/api-docs",
    swaggerUi.serve,
    swaggerUi.setup(swaggerSpec, { explorer: true })
  );
};
