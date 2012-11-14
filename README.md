# SongForge

SongForge organize songs for karaoke.

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/yono/songforge)

## Dependency

* Ruby 1.9.3
* bundler
* SQLite3

## Getting Started

clone this repository.

```bash
$ git clone https://github.com/yono/songforge.git
$ cd songforge
```

install gems by bundler

```bash
$ bundle install --without production --path vendor/bundle
```

migrate

```bash
$ bundle exec rake db:migrate
```

launch server

```bash
$ bundle exec rails s
```
