const express = require("express");
const path =  require("path");

const app = express();
app.use("/tunneled-content", express.static(path.join(__dirname + "/public"))); //serving files from public folder
                                  // In that folder I can place everything for my website

app.get("/api", (req, res) => {
  res.json("HTTP GET request received");
})

app.use((req, res) => {
  //res.status(404);
  //res.send("<h1>Error 404: Resource Not found</h1>")

  //ESTE ES EL BUENO PERO NO CUMPLE CON SER EN EL <BODY>
  res.setHeader('Content-Type', 'application/json');
  //const jsonHeaders = JSON.stringify(req.headers);
  res.json(req.headers)
  //res.send(jsonHeaders);

  /*
  const reqHeaders = JSON.stringify(req.headers)
  res.send("<body>"+reqHeaders+"</body>");
  */
})

app.listen(3000, () => {
  console.log("App listening on port 3000");
})
