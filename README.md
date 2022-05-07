# Physics Simulation

A physics simulation website (mainly for spacecraft orbits and launches) using Ruby on Rails, Postgresql, Hotwire, StimulusJS, ThreeJS, and D3JS.

## Development Setup

In order to develop this application on your local machine, follow these steps:

* Install Ruby and its dependencies (see .ruby-version for the current Ruby version).

* Install PostgreSQL and its dependencies.

* Clone this repository.

* From the root directory, run

```bash
bundle install

rails db:create

rails db:migrate

rails db:seed
```

* Finally, to launch the development server, run

```bash
bin/dev
```

* Press ctrl + C to stop the server.

## Contributing

All contributions are encouraged and welcomed! Please reach out with any questions.

### Tests

From the root directory, run

```bash
bundle exec rspec
```

Please add new tests for any new features added/changed!

### Security Static Analysis

From the root directory, run

```bash
bundle exec brakeman
```

### Code Style

Rubocop with a custom configuration is used to enforce consistent code style throughout the application.

From the root directory, run

```bash
bundle exec rubocop
```
