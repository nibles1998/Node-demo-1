const animalCtrl = require('../controllers').animal;
const routesAnimal = require('express').Router();

routesAnimal.get('/',animalCtrl.getHandler);
routesAnimal.post('/',animalCtrl.postHandler);
routesAnimal.put('/',animalCtrl.putHandler);
routesAnimal.delete('/',animalCtrl.deleteHandler);

module.exports = routesAnimal;