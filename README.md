# README

## Create database with:

```sh
docker run -d \
  --name quote-editor-rails \
  -p 5432:5432 \
  --network host \
  -e POSTGRES_DB=quote_editor \
  -e POSTGRES_USER=quote_editor \
  -e POSTGRES_PASSWORD=password \
  postgres:14
```

## Connect to the database with:

```sh
psql -h localhost -U quote_editor -W
```

## Create redis with:

```sh
docker run -d \
  --name quote-editor-redis \
  --network host \
  redis:7
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```ruby
Company.find_by_name("KPMG")
Quote.create(company: Company.find_by_name("KPMG"), name: "12312313")
```