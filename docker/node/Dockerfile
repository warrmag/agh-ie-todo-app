FROM node:12.7.0

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable sudo

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# set working directory
WORKDIR /app

# ADD NODE TO SUDOERS
RUN usermod -aG sudo node && echo "node ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY . .

RUN sudo chown -R node:node /app

RUN yarn global add @angular/cli@latest

USER node

ENTRYPOINT ["/entrypoint.sh"]
CMD ["yarn", "start"]
EXPOSE 4200 49153
