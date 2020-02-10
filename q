[33mcommit 35e3a65ec4a427c4ee87505b97b7331d66ade56d[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;31morigin/master[m[33m, [m[1;31morigin/issue-9[m[33m, [m[1;31morigin/HEAD[m[33m, [m[1;32missue-9[m[33m)[m
Author: nibles1998 <longvynguyenhoang@gmail.com>
Date:   Mon Feb 10 15:42:57 2020 +0700

    Add commad on package.json

[1mdiff --git a/package.json b/package.json[m
[1mindex 5737630..9a6f8b1 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -4,7 +4,9 @@[m
   "description": "A",[m
   "main": "index.js",[m
   "scripts": {[m
[31m-    "test": "echo \"Error: no test specified\" && exit 1"[m
[32m+[m[32m    "test": "echo \"Error: no test specified\" && exit 1",[m
[32m+[m[32m    "start": "node index.js",[m
[32m+[m[32m    "watch": "nodemon index.js"[m
   },[m
   "repository": {[m
     "type": "git",[m

[33mcommit 5b2a3d606a665c2760bd7b4f402ba4e2e2bace6e[m[33m ([m[1;31morigin/issue-8[m[33m, [m[1;32missue-8[m[33m)[m
Author: nibles1998 <longvynguyenhoang@gmail.com>
Date:   Mon Feb 10 15:36:17 2020 +0700

    Modify Server

[1mdiff --git a/index.js b/index.js[m
[1mindex ae8cc27..72973ff 100644[m
[1m--- a/index.js[m
[1m+++ b/index.js[m
[36m@@ -1,6 +1,14 @@[m
 const express = require('express');[m
 const bodyParser = require('body-parser');[m
[32m+[m[32mconst { PORT } = require('./config');[m
[32m+[m[32mconst initRoot = require('./routes');[m
 [m
 const app = express();[m
 [m
[31m-app.listen();[m
\ No newline at end of file[m
[32m+[m[32mapp.use(bodyParser.urlencoded({ extended: true }));[m
[32m+[m
[32m+[m[32minitRoot(app);[m
[32m+[m
[32m+[m[32mapp.listen(PORT,() => {[m
[32m+[m[32m    console.log(`Server is running with port ${PORT}`);[m
[32m+[m[32m});[m
\ No newline at end of file[m

[33mcommit 77cf1a930dc5844a6ebd4b4bd0d5e2cf2f37f691[m[33m ([m[1;31morigin/issue-7[m[33m, [m[1;32missue-7[m[33m)[m
Author: nibles1998 <longvynguyenhoang@gmail.com>
Date:   Mon Feb 10 15:28:38 2020 +0700

    Implement port for server

[1mdiff --git a/config/index.js b/config/index.js[m
[1mindex e69de29..c602471 100644[m
[1m--- a/config/index.js[m
[1m+++ b/config/index.js[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32mconst config = {[m
[32m+[m[32m    PORT: 3000,[m
[32m+[m[32m};[m
[32m+[m
[32m+[m[32mmodule.exports = config;[m
\ No newline at end of file[m

[33mcommit 15de273e73346aa96d7e2b8ab939d03ea34e58c2[m[33m ([m[1;31morigin/issue-6[m[33m, [m[1;32missue-6[m[33m)[m
Author: nibles1998 <longvynguyenhoang@gmail.com>
Date:   Mon Feb 10 15:22:10 2020 +0700

    Implement root for animal

[1mdiff --git a/routes/index.js b/routes/index.js[m
[1mindex e69de29..ef132ac 100644[m
[1m--- a/routes/index.js[m
[1m+++ b/routes/index.js[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32mconst animal = require('./animal');[m
[32m+[m
[32m+[m[32mconst initRoot = function(app){[m
[32m+[m[32m    app.use('/animal',animal);[m
[32m+[m[32m};[m
[32m+[m
[32m+[m[32mmodule.exports = initRoot;[m
\ No newline at end of file[m

[33mcommit 439a0849f433d878c12a4d3060afa3dfe42f78d9[m[33m ([m[1;31morigin/issue-5[m[33m, [m[1;32missue-5[m[33m)[m
Author: nibles1998 <longvynguyenhoang@gmail.com>
Date:   Mon Feb 10 15:11:33 2020 +0700

    Implement routes for animal

[1mdiff --git a/routes/animal.js b/routes/animal.js[m
[1mnew file mode 100644[m
[1mindex 0000000..c19187f[m
[1m--- /dev/null[m
[1m+++ b/routes/animal.js[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32mconst animalCtrl = require('../controllers').animal;[m
[32m+[m[32mconst routesAnimal = require('express').Router();[m
[32m+[m
[32m+[m[32mroutesAnimal.get('/',animalCtrl.getHandler);[m
[32m+[m[32mroutesAnimal.post('/',animalCtrl.postHandler);[m
[32m+[m[32mroutesAnimal.put('/',animalCtrl.putHandler);[m
[32m+[m[32mroutesAnimal.delete('/',animalCtrl.deleteHandler);[m
[32m+[m
[32m+[m[32mmodule.exports = routesAnimal;[m
\ No newline at end of file[m
