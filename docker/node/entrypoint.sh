#!/bin/sh
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
printf "${BLUE}Starting frontend container\n"

sudo chown -R node:node /usr/local/lib/node_modules
sudo chown -R node:node /app/node_modules

printf "${BLUE}Installing node_modules\n"
npm install

printf "${GREEN}Entrypoint finished\n"
printf "${GREEN}Starting angular server\n${NC}"

exec "$@"
