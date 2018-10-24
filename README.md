# SongForge

SongForge organize songs for karaoke.

[![CircleCI](https://circleci.com/gh/yono/songforge.svg?style=svg)](https://circleci.com/gh/yono/songforge)
[![Code Climate](https://codeclimate.com/github/yono/songforge.png)](https://codeclimate.com/github/yono/songforge)
[![Coverage Status](https://coveralls.io/repos/yono/songforge/badge.png)](https://coveralls.io/r/yono/songforge)

## Dependency

* Ruby 2.5.1
* bundler
* PostgreSQL
* Docker (for development)

## Getting Started

clone this repository.

```bash
$ git clone https://github.com/yono/songforge.git
$ cd songforge
```

build docker containers

```bash
$ docker-compose build
```

launch server

```bash
$ docker-compose up
```

create DB and migrate

```bash
$ docker-compose exec web bin/rake db:create db:migrate
```

```
login user: user
password: password
```
