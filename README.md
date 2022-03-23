# Physics Simulator

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

## Tests

From the root directory, run

```bash
bundle exec rspec
```

to run all of the tests. Ensure all tests pass (and you add new tests for new code) before merging.
