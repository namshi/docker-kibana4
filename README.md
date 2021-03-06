# namshi/docker-kibana4

A docker container to run kibana, compatible with [found.no](https://found.no/).

## Installation

```
docker build -t namshi/docker-kibana4 .
```

## Running

```
fig up
```

or, if you wanna be fancy:

```
docker run -ti -p 5601:5601 namshi/docker-kibana4
```

This will connect to an elasticsearch supposed
to run on `localhost:9200`. If you want to connect
to an ES instance located somewhere else
just specify it through an environment variable:

```
docker run -ti -p 5601:5601 -e elasticsearch_host=https://example.com:9200/ namshi/docker-kibana4
```
Also if you don't need to expose the elasticsearch host, you can set it up as an env variable and mount it to the settings folder.

For example
```
docker run -ti -p 5601:5601 -v /<your file which have the details of elasticsearch_host>/:/settings/setup-env.sh namshi/docker-kibana4
```
or, alternatively, configure it in the fig file:

```
web:
  build: .
  ports:
   - "5601:5601"
  environment:
    elasticsearch_host: https://example.org:9200
```

## Credits

All work from [Ayham](https://github.com/ayhamalzoubi) ;-)
