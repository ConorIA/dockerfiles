# neutron-webclient

[![](https://images.microbadger.com/badges/version/conoria/neutron-webclient.svg)](https://microbadger.com/images/conoria/neutron-webclient "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/conoria/neutron-webclient.svg)](https://microbadger.com/images/conoria/neutron-webclient "Get your own image badge on microbadger.com")

A clean(ish) Alpine-based image used to run [Neutron](https://github.com/emersion/neutron) with the [Neutron-WebClient](https://github.com/vpapadopou/Neutron-WebClient) UI. The database and config should be run independent of the container.

## Usage
You should mount a local folder called 'config' containing your `config.json` and a `db` directory to `/config` in the container. You can clone this repo, which includes everything you need. Use the `docker-compose.yml` included in this repo or run:
```
docker run -v $PWD/config:/config -p 4000:4000 conoria/neutron-webclient

```
