# CHANGELOG

## 18/11/2019 (1.8.1)

- Bump Alpine Linux to 3.10.3
- Bump Docker to 18.09.8
- Bump Docker-Compose to 1.24.1 as native package

## 23/06/2019 (1.8.0)

- Bump Alpine Linux to 3.10.0
- Bump Docker to 18.09.6

## 02/06/2019 (1.7.0)

- Bump Alpine Linux to 3.9.4
- Bump Docker to 18.09.1
- Bump Docker-compose to 1.24.0

## 13/01/2019 (1.6.2)

- Upgrade to Alpine Linux 3.8.2
- Upgrade Docker-Compose to 1.23.2

## 24/09/2018 (1.6.1)

- Upgrade to Alpine Linux 3.8.1
- Upgrade Docker to 18.06.1-r0-CE

## 20/07/2018 (1.6.0)

- Upgrade to Alpine Linux 3.8.0
- Upgrade Docker to 18.03.1-r0-CE
- Upgrade Docker-Compose to 1.22.0

## 11/12/2017 (1.5.0)

- Upgrade to Alpine Linux 3.7.0 (adapting the boot sequence)
- Relaxing some PaX / GRSec kernel enforcements to allow nested containers (LXC and docker)
- Upgrade Docker to 17.12.1-CE

## 28/09/2017 (1.4.0)

- Upgrade Alpine Linux to 3.6.2
- Upgrade Docker to 17.05-CE

## 11/06/2017 (1.3.0)

- From GH-5
  - Alpine Linux upgraded to 3.6.1
  - Docker installed from the "community" apk repository
  - VM Default hostname is now "alpine2docker"
  - Apk mirror is now auto selected

## 20/05/2017 (1.2.1)

- From GH-4:
  - Alpine Linux to 3.5.2
  - Rsync is installed for vagrant share
  - Docker Engine to 17.05_ce
  - Docker-Compose to 1.13.0
  - Pax and GrSec settings applied BEFORE customization

## 26/03/2017 (1.2.0)

- From GH-3:
  - Moving Docker and Compose to "rolling" version based on Edge repository
- Docker upgraded (by rolling effect) to CE 17.03.0
- Docker-Compose upgraded (by rolling effect) to 1.11.2

## 17/02/2017 (1.1.0)

- From GH-2:
  - Moving docker-compose version to 1.11.0
  - Adding Swap support for containers (cgroup swap and meme accounting)
  - Making GRSec less aggressive to allow running non alpine linux JVM inside containers
- From GH-1:
  - Introducing a customization endpoint to build your own machine

Published on <https://atlas.hashicorp.com/dduportal/boxes/alpine2docker/versions/1.1.0>

Release hashes:

- SHA256: 0e6913f6dc14162b1cb04dd920b7f05494de37920fd68a8895eb287c0c485cb6
- SHA1: f0e51cfa108d94ecdbd6f42f7d394a01ef9a3d03
- MD5: 892f3acc90489d7be4d278da2fe8abcb

## 29/01/2017 (1.0.0)

- Initial Release:
  - Alpine Linux 3.5, virtual edition
  - Docker 1.13.0
  - Docker-Compose 1.10.0
  - No VirtualBox additions

Published on <https://atlas.hashicorp.com/dduportal/boxes/alpine2docker/versions/1.0.0>

Release hashes:

- SHA256: 8eb0bfb11efefb211ef508e08a685cf7f7f733b56670ba98bad6270b680a06a0
- SHA1: a45a297bf892f6ee8f486ee385ee2a1bae583be0
- MD5: 5b3913b726831c8aa2a9a51314e3a766
