# SongForge

SongForge organize songs for karaoke.

[![Travis CI](https://travis-ci.org/yono/songforge.png)](https://travis-ci.org/yono/songforge)
[![Code Climate](https://codeclimate.com/github/yono/songforge.png)](https://codeclimate.com/github/yono/songforge)
[![gemnasium](https://gemnasium.com/yono/songforge.png)](https://gemnasium.com/yono/songforge)
[![Coverage Status](https://coveralls.io/repos/yono/songforge/badge.png)](https://coveralls.io/r/yono/songforge)

## Dependency

* Ruby 2.2.3
* bundler
* PostgreSQL

## Getting Started

clone this repository.

```bash
$ git clone https://github.com/yono/songforge.git
$ cd songforge
```

install gems by bundler

```bash
$ bundle install --path vendor/bundle
```

migrate

```bash
$ bundle exec rake db:migrate
```

prepare `.env` file.

```bash
$ echo 'SECRET_TOKEN=random_string_as_secret_token' > .env`
```

launch server

```bash
$ bundle exec foreman start
```
or

```bash
$ bundle exec rails s
```
