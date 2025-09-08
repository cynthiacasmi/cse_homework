const express = require("express");

const app = express();
app.use(express.static("public")); //serving files from public folder
                                  // In that folder I can place everything for my website

app.listen(3000, () => {
  console.log("App listening on port 3000");
})
