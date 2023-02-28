# Actividad #3

El problema se encuentra en que las redirecciones no son bien realizadas, para arreglar dicho problema es necesario modificar nuestro archivo de Dockerfile y realizar la configuración siguiente, quedando nuestro Dockerfile de la siguiente manera:

#### Anterior
```
## BUILD
# docker build -t mifrontend:0.1.0 .
## RUN
# docker run -d -p 3000:3000 mifrontend:0.1.0
FROM node:18.14.0-buster-slim

LABEL developer="jesus guzman" \
      email="susguzman@gmail.com"

# Copy app
COPY . /opt/app

WORKDIR /opt/app

# Npm install
RUN npm install

RUN npm run build

RUN npm install -g serve

# Container Startup
CMD ["serve", "-s", "build"]
```
#### Corregido

```
## BUILD
# docker build -t mifrontend:0.1.0 .
## RUN
# docker run -d -p 3000:3000 mifrontend:0.1.0
FROM node:18.14.0-buster-slim

LABEL developer="jesus guzman" \
      email="susguzman@gmail.com"

# Copy app
COPY . /opt/app

WORKDIR /opt/app

# Npm install
RUN npm install

RUN npm run build

COPY --from=build-stage /app/build/ /usr/share/nginx/html

COPY --from=build-stage /nginx.conf /etc/nginx/conf.d/default.conf

RUN npm install -g serve

# Container Startup
CMD ["serve", "-s", "build"]
```