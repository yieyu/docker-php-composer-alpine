## Docker Container for PHP and Composer

This is a docker container for PHP 7 with composer installed. It can be used with
any PHP project using composer. As this image is build on top of the
[Alpine Linux](http://www.alpinelinux.org/) base image its very small at `~47 MB`.

## Pull it from docker registry

To pull the docker image you can do it with:

```
docker pull yieyu/php7
```

## Usage

Adding these 3 lines into ~/.bash_aliases:
```
function START_DOCKER { docker run --rm -ti -v $(pwd):/app -u $(id -u):$(id -g) $DOCKER_PARAM "$@"; }
alias php="START_DOCKER yieyu/php7 php"
alias composer="START_DOCKER -v $HOME/.ssh:/home/.ssh:ro -v $HOME/.composer:/home/.composer yieyu/php7 composer"
```

You may start artisan dev server like this:
```
DOCKER_PARAM="-p 8000:8000" php artisan serve --host=0.0.0.0
```

## As base image

You can use it as a base image like below:

```
FROM yieyu/php7

//my docker image contents
```
