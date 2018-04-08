# Cocoremo

Cocoremo is a smart home service.

## Setup

Build docker container image.

```
docker-compose build
```

Install ruby gems.

```
docker-compose run --rm app bundle install
```

Install yarn integrity files.

```
docker-compose run --rm app yarn install
```

Edit configuration files.

* config/secrets.yml
* config/database.yml
* config/cable.yml

Create database and schema migration.

```
docker-compose run --rm app rails db:create
docker-compose run --rm app rails db:migrate
```

Run servers.

```
docker-compose up
```

## Development

### Test

Run test

```
docker-compose run --rm app rspec
```


## License

Cocoremo is licensed under the [MIT license](LICENSE).
