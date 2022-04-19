# SongForge

SongForge organize songs for karaoke.

[![CircleCI](https://circleci.com/gh/yono/songforge.svg?style=svg)](https://circleci.com/gh/yono/songforge)
[![Code Climate](https://codeclimate.com/github/yono/songforge.png)](https://codeclimate.com/github/yono/songforge)
[![Coverage Status](https://coveralls.io/repos/yono/songforge/badge.png)](https://coveralls.io/r/yono/songforge)

## Dependency

* Ruby (see `.ruby-version`)
* bundler (see `Gemfile.lock`)
* node (see `.node-version`)
* PostgreSQL
* Docker (for development)

## Getting Started

clone this repository.

```bash
$ git clone https://github.com/yono/songforge.git
$ cd songforge
```

launch server

```bash
$ docker-compose up -d
```

create DB and migrate

```bash
$ bin/rails db:create db:migrate
```

```
login user: user
password: password
```
