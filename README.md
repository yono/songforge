# SongForge

SongForge organize songs for karaoke.

[![Code Climate](https://codeclimate.com/github/yono/songforge.png)](https://codeclimate.com/github/yono/songforge)
[![gemnasium](https://gemnasium.com/yono/songforge.png)](https://gemnasium.com/yono/songforge)

## Dependency

* Ruby 2.1.0
* bundler 1.3.5
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

launch server

```bash
$ bundle exec foreman start
```
or

```
$ bundle exec rails s
```
