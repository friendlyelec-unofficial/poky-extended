# docker-builder
[![Docker Image Build](https://github.com/yocto-wrt/docker-builder/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/yocto-wrt/docker-builder/actions/workflows/docker-publish.yml)

## What is this?

docker.io/crops/poky:debian-11 with these packages insalled:

```none
rsync 
gdisk 
fdisk 
dosfstools 
mtools 
bison 
flex 
zsh 
git 
curl 
wget
```

## Did I just see zsh?

Sure did. Hope you like the `gnzh` theme.

## So how do I use this?

```
docker run --rm -it \
  --volume "$POKYUSER_HOME:/home/pokyuser:rw" \
  --volume "$YOCTO_DIR:/opt/yocto:rw" \
  ghcr.io/g-o-o-s/openwrt-autobuild:main bitbake -v your-image-target
```

Alternatively, for a more interactive experience:
```
cd $repo && \
YOCTO_DIR=/some/directory/can/be/relative \
POKYUSER_HOME=/can/be/omitted \
./shell.sh
```

## What?

The first volume defines a persistent directory for the pokyuser account. \
If you mount this, you're responsible for copying in .bashrc and friends.

The second volume is your yocto working directory. \
You're responsible for the contents, we don't do anything special here.
