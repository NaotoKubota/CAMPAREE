# Docker container for CAMPAREE

Dockerfile for [CAMPAREE](https://github.com/itmat/CAMPAREE/tree/main): A RNA expression simulator that is primed using real data to give realistic output.

It's on [dockerhub](https://hub.docker.com/r/naotokubota/camparee) and [github](https://github.com/NaotoKubota/CAMPAREE).

## tags and links

- `1.0` [(master/Dockerfile)](https://github.com/NaotoKubota/CAMPAREE/blob/master/Dockerfile)

## how to build

```sh
docker pull naotokubota/camparee:1.0
```

or

```sh
git clone git@github.com:NaotoKubota/CAMPAREE.git
cd CAMPAREE
docker build --rm -t naotokubota/camparee:1.0 .
```

## running

```sh
docker run --rm -it naotokubota/camparee:1.0
```
