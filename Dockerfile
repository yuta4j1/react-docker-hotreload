FROM mhart/alpine-node:11 as build

COPY . /app
WORKDIR /app
RUN npm run build

FROM mhart/alpine-node:11
RUN npm install --global serve
COPY --from=build /dist .

CMD ["serve", "-p", "3000", "-s", "."]
