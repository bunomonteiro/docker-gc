# A Docker (in docker) Garbage Collector
Uses `crontab` to run `'docker system prune -a -f'`

## Variables
- **CRON_EXPRESSION**: A cron expression used to register the job. Default: * * * * *

> Must see: https://crontab.guru

## Running as ad-hoc
Example 1: prune every minute
```shell
$ docker run -d -v /var/run/docker.sock:/var/run/docker.sock bunomonteiro/docker-gc
```

Example 2: prune at 00:00 everyday
```shell
$ docker run -d -v /var/run/docker.sock:/var/run/docker.sock -e CRON_EXPRESSION="0 0 * * *" bunomonteiro/docker-gc
```

> It's mandatory to bind docker socket: `-v /var/run/docker.sock:/var/run/docker.sock`

## Quick reference
- Maintained by: [Bruno Monteiro](https://github.com/bunomonteiro/docker-gc)
- Dockerfile link: [Dockerfile](https://github.com/bunomonteiro/docker-gc/blob/main/Dockerfile)

# License
This Docker image and the source is issued under MIT license, a permissive free license, which means you can modify it as you please, and incorporate it into your own commercial or non-commercial software.