# mini-hugo

## Quick and easy hugo env for devlopment in Docker

## usage

From inside your hugo site directory, with the config file at the root

```
docker run --rm -p 1313:1313 -v $PWD:/mnt/site gcr.io/tcb-web/mini-hugo
```

Then browse to localhost:1313 for the site. The flags included in the entrypoint in the Dockerfile will auto render to disk. So the 'public' dir will be populated with the site as you work on it. 


