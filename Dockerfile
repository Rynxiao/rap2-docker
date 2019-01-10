FROM nginx:latest
LABEL maintainer="ryn"
ENV STATIC_PATH /usr/share/nginx/html
ENV PROJECT_NAME rap2-dolores

# Bundle app source
COPY ./build/ $STATIC_PATH/$PROJECT_NAME/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/conf.d/ /etc/nginx/conf.d/