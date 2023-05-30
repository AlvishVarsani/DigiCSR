require("./Database/Connection");
require("dotenv").config({ path: "../.env" });
const cors = require("cors");
const express = require("express");

const app = express();
const PORT = process.env.PORT;

app.use(cors());

app.use(express.urlencoded({ limit: "10mb", extended: true }));
app.use(express.json({ limit: "10mb" }));

require("./Routes/AuthRoutes")(app);
require("./Routes/ProfileRoutes")(app);
require("./Routes/RFPRoutes")(app);
app.listen(PORT, () => {
  console.log("Server listening...");
});
