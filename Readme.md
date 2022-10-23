## Base commands

`docker build -t ejs-node .`  - build an image with tag ejs-node out of current directory contents

`docker run --name ejs --rm -p 4200:3000 -d ejs-node`  
  run container with:  
  name=ejs,  
  delete when stopped,  
  forward port from 3000 to 4200,  
  detach process,  
  image ejs-node

`docker ps -a`  - show all the containers (nomatter running or stopped)
`docker ps`     - show running containers
`docker images` - show image list

`docker logs ejs` - allows to observer the container logs to the console


## Improvements

- The commands order are relevant in dockerfile.  
So we first copy `package.json` and then we run `npm i` command. It gives us the advantage of getting further builds of the `node_modules` folder directly from cache.  


## Pushing

- before pushing don't forget to create the `.dockerignore` file
- to push to the `https://hub.docker.com` run command `docker push slimbde/ejs-node`

## Environment

- In Dockerfile we can specify ENV variables. So let's specify `ENV PORT 3000` that means we use 3000 port by default
- However, we can substitute default value by using `-e` parameter of the command `docker run`  
  `docker run --name ejs --rm -p 3000:4321 -d -e PORT=4321 slimbde/ejs-node` - we run image internally on port 4321

## Volumes

- Are used to save the state of files in a certain directory
- In `Dockerfile` we should specify `VOLUME ["/app/data"]` for instance to save `/data` folder directory
- In `docker run` command we specify `docker run -d --name ejs -p 3000:3000 --rm -v ejs:/app/data slimbde/ejs-node`

## Development using volumes

- create anonymous volume for node_modules folder `-v /app/node_modules`
- create named volume `-v C:/SPA/docker/logs-app-minin:/app`
- so the full cmd would be like  
`docker run -d --name ejs -p 3000:3000 --rm -v ejs:/app/data -v /app/node_modules -v "C:/SPA/docker/logs-app-minin:/app" slimbde/ejs-node`

- now we can do any changes in any files and they will be applied to the target image