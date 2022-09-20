FROM node:16-alpine AS deps
ENV PROJECT_ROOT=/monorepo/
COPY ./ ./monorepo
WORKDIR /monorepo
RUN apk --no-cache add nodejs yarn --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    && yarn install \
    && yarn build
ENTRYPOINT ["yarn", "start"]
