## Getting started

Assuming you have docker up and running. Check issues below or this
[gist](https://gist.github.com/pawlik/8d0d2e42475a0ff7a6ad) for more help.

```bash
cd images/php
docker build -t kinetic:php .
```
This should build custom php image we're using (check php node in `docker-compose.yml`)

Then in main catalogue:
```
docker-compose up
```
this should start all the containers.

now preffered way to install N3 would be:
`docker-compose run php shell/bulbulator/bulbulate.sh`

At this point it runs composer, but fails on bower.

Try to

Or you can `./enter-container php` and try to bulbulate new instance there (experimental)

You will have to manually change redis hostname from 127.0.0.1 to redis.
You should be able to debug your app.

## Things to improve:
[ ] Bulbulating should probably be run outside of php container (this is complex issue)
[ ] after installation redis config should be automatically changed to redis
[x] composer cache seems to ignore cache's from data volume
[ ] after first `compose install` it uses cache, but after restarting containers probably not
[ ] composer has some issues with github authentication (token can help?)
