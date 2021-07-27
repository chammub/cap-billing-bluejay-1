const cds = require("@sap/cds");
const implementation = require("./server-implementation");

/**
 * In production the launchpad home is over writtern by defaults
 */

if (process.env.NODE_ENV === "PROD") {
  cds.on("bootstrap", async (app) => await implementation(app));
} else {
  const cds_swagger = require("cds-swagger-ui-express");
  cds.on("bootstrap", async (app) => {
    // custom auth implementation
    await implementation(app);
    // swagger ui
    app.use(cds_swagger());
  });
}

module.exports = cds.server;
