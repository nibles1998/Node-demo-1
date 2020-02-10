const express = require('express');
const bodyParser = require('body-parser');
const { PORT } = require('./config');
const initRoot = require('./routes');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));

initRoot(app);

app.listen(PORT,() => {
    console.log(`Server is running with port ${PORT}`);
});