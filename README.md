# Search members

[![Build Status](https://travis-ci.org/giusepped/search-for-member.svg?branch=master)](https://travis-ci.org/giusepped/search-for-member)
[![Coverage Status](https://coveralls.io/repos/github/giusepped/search-for-member/badge.svg?branch=master)](https://coveralls.io/github/giusepped/search-for-member?branch=master)
[![Code Climate](https://codeclimate.com/github/giusepped/search-for-member/badges/gpa.svg)](https://codeclimate.com/github/giusepped/search-for-member)
[![Dependency Status](https://gemnasium.com/giusepped/search-for-member.svg)](https://gemnasium.com/giusepped/search-for-member)

This is a Rails app that allows you to search for members of both houses of Parliament using a keyword that represents one of their interests (e.g. "Housing", "Yorkshire", "Africa" etc). Once you get a list of members back, you can click on each one of them to get a bio page for that particular member.  It was created as part of the exploration for the new [parliament](www.parliament.uk) website.   

The current [parliament](www.parliament.uk) application can be found [here](https://github.com/ukparliament/parliament.uk-prototype).

## Usage

```bash
$ docker-machine create --driver virtualbox default
$ docker-compose up
```

## Testing

```bash
$ docker-compose build
$ docker-compose run web rake spec
$ docker-compose down
```
