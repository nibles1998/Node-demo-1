const animal = require('./animal');

const initRoot = function(app){
    app.use('/animal',animal);
};

module.exports = initRoot;