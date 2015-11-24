## Getting started


Assuming you have docker up and running. Check issues below or this
[gist](https://gist.github.com/pawlik/8d0d2e42475a0ff7a6ad) for more help.

clone Kinetic/N3 app into this project - N3 catalogue
switch to (my branch)[https://github.com/pawlik/N3/tree/docker-version] or if
(this PR is accepted)[https://github.com/NexwayGroup/N3/pull/2711] you can use whatever branch in sync with it


```bash
cd images/php
docker build -t kinetic:php .
```
This should build custom php image we're using (check php node in [docker-compose.yml](docker-compose.yml))

Then in main catalogue:
```
docker-compose up -d
```
this should start all the containers (you can attach yourself to all containers logs with `docker-compose logs`).

now preffered way to install N3 would be:
`docker-compose run php shell/bulbulator/bulbulate.sh`

all necessary envs are defined in [docker-compose.yml](docker-compose.yml) on php container

## Xdebug
it has some annoying issue - when debugging on PHPStorm10 - it triggers Fatal error about
uninitialized static variable whenever you try to step-over such statement
[like here](https://github.com/NexwayGroup/N3-Magento-Core/blob/8f531a2258794303f505455c2011992d336ac850/app/Mage.php#L666)

Current workaround: set up beakpoint behind it, cross your fingers and press F9 (there's a lot of such places, so be
extra careful) - this makes it little bit PITA to treat as dev env yet.

## Things to improve:
- [ ] move BBL envs from docker-compose.yml to env file
- [ ] fix xdebug issues
- [ ] (optional) use different DB's for different branches maybe (for quick switches)
- [ ] fulfillment doesn't work - need to check networking stuff with docs vs our VPN
- [x] Bulbulating should probably be run outside of php container (this is complex issue)
- [x] after installation redis config should be automatically changed to redis
- [x] composer cache seems to ignore cache's from data volume
- [x] after first `compose install` it uses cache, but after restarting containers probably not
- [x] composer has some issues with github authentication (token can help?)
