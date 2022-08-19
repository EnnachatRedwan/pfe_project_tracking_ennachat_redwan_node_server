const express = require("express");

const users_router = require("./routes/usersRoutes");
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");

process.env.TOKEN_KEY =
  "78d2205c21d28f72d22c22696d730d553da52180fc1adae3d2301625faf17f651045cc00d0a4f856773043096e7ea836fd2de3222e67599aec7bf972bf49defd";

const app = express();

app.use(bodyParser.urlencoded({ extended: false }));

app.use(bodyParser.json({}))

app.use("/users", users_router);

app.get("/", (req, res) => {
  const token = req.body.token;
  res.send(
    jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
      if (err) res.send(err);
      res.send(user)
    })
  );
});

app.use((req, res) => {
  res.set("content-type", "text/html");
  res.send("<h1>404</h1>");
});

app.listen(3000);
