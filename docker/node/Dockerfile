FROM node:12.7.0

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable sudo

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# set working directory
WORKDIR /app

RUN npm install -g @angular/cli@latest -vv

# ADD NODE TO SUDOERS
RUN usermod -aG sudo node && echo "node ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN sudo chown -R node:node /app

USER node

ENTRYPOINT ["/entrypoint.sh"]
CMD ng serve --host 0.0.0.0
EXPOSE 4200
