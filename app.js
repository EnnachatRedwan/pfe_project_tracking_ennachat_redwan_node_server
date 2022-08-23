const express = require("express");

const bodyParser = require("body-parser");

const users_router = require("./routes/usersRoutes");
const projects_router=require("./routes/projectsRoutes");
const employees_router=require("./routes/employeesRoutes");

process.env.TOKEN_KEY =
  "78d2205c21d28f72d22c22696d730d553da52180fc1adae3d2301625faf17f651045cc00d0a4f856773043096e7ea836fd2de3222e67599aec7bf972bf49defd";

const app = express();

app.use(bodyParser.urlencoded({ extended: false }));

app.use(bodyParser.json({}))

app.use("/users", users_router);

app.use("/projects",projects_router);

app.use('/employees',employees_router);

app.use((req, res) => {
  res.set("content-type", "text/html");
  res.send("<h1>404</h1>");
});

app.listen(3000);
