## Base commands

`docker build -t ejs-node .`  - build an image with tag ejs-node out of current directory contents

`docker run --name ejs --rm -p 4200:3000 -d ejs-node`  
  run container with:  
  name=ejs,  
  delete when stopped,  
  forward port from 3000 to 4200,  
  detach process,  
  image ejs-node

