#!/bin/bash

#On error no such file entrypoint.sh, execute in terminal - dos2unix .docker\entrypoint.sh

### WWW
chown -R node:node .

### FRONT-END
npm install

npm run dev