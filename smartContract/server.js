// server.js
// where your node app starts

// we've started you off with Express (https://expressjs.com/)
// but feel free to use whatever libraries or frameworks you'd like through `package.json`.
const express = require("express");

const app = express();

var hedera = require("./hedera");

hedera.init();

// make all the files in 'public' available
// https://expressjs.com/en/starter/static-files.html
app.use(express.static("public"));

// https://expressjs.com/en/starter/basic-routing.html
app.get("/", (request, response) => {
  response.sendFile(__dirname + "/views/index.html");
});

// send the default array of dreams to the webpage
app.post("/balance", async (request, response) => {
  // express helps us take JS objects and send them as JSON
    let resp = await hedera.hashSdk.triggerCheckBalance("0.0.99", (err, res) => {
      console.log('SUCCESS ACCOUNT_INFO cb:::', res);
      console.log('ERROR ACCOUNT_INFO cb:::', err);
    });
    response.json([resp.balance]);
});

// send the default array of dreams to the webpage
app.get("/balance", async (request, response) => {
  // express helps us take JS objects and send them as JSON
    let resp = await hedera.hashSdk.triggerCheckBalance("0.0.99", (err, res) => {
      console.log('SUCCESS ACCOUNT_INFO cb:::', res);
      console.log('ERROR ACCOUNT_INFO cb:::', err);
    });
    response.json([resp.balance]);
});

app.get("/testing", async (request, response) => {
  // express helps us take JS objects and send them as JSON
    let resp = await hedera.scSimpleTester.addTwoNumber(1,2, (err, res) => {
      console.log('SUCCESS add_two cb:::', res);
      console.log('ERROR add_two cb:::', err);
    }).catch((error) => {
      console.error(error);
    });
    response.json([resp]);
});

// send the default array of dreams to the webpage
app.get("/message", async (request, response) => {
  // express helps us take JS objects and send them as JSON
    var msg = String(request.query.message) + " testing";
    let resp = await hedera.scHelloWorld.update("hello", (err, res) => {
      console.log('SUCCESS ACCOUNT_INFO cb:::', res);
      console.log('ERROR ACCOUNT_INFO cb:::', err);
    }).catch((error) => {
      console.error(error);
    });
    response.json({success:true, msg:"Message sent"});
});

// listen for requests :)

const listener = app.listen(process.env.PORT, () => {
  console.log("Your app is listening on port " + listener.address().port);
});