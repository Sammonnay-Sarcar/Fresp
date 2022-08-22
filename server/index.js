const express = require("express");
const cors = require("cors");
const app = express();
const mongoose = require("mongoose");
require('dotenv/config');




//middleware
app.use(cors());
app.options('*', cors())
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//routes
const usersRoutes = require('./routes/users.route')

const api = process.env.API_URL;
const PORT = process.env.PORT||8080;



//Database
mongoose.connect(process.env.DB_CONNECTION_STRING, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(()=>{
  console.log('Database Connection is ready...')
})
.catch((err)=> {
  console.log(err);
})


// simple route
app.get("/", (req, res) => {
  res.json({ message: "Welcome to bezkoder application." });
});
app.use(`${api}/user`, usersRoutes);

// set port, listen for requests
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});