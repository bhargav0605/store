# Load generator

The load generator sends synthetic shopping requests to the frontend using Locust.
It is disabled by default and runs independently of the application services.

## Controls

- `LOAD_GENERATOR_ENABLED` unset, empty, or `false`: exit successfully without starting Locust.
- `LOAD_GENERATOR_ENABLED=true`: start generating traffic.
- Any other value: exit with a configuration error.

When enabled, `FRONTEND_ADDR` must be the frontend's `host:port`, without an
`http://` prefix. `USERS` defaults to `10` concurrent users and `RATE` defaults
to `1` new user per second. Additional command-line arguments are passed to Locust.

## Run locally

From the repository root, install the dependencies in a Python virtual environment:

```sh
python -m pip install -r src/loadgenerator/requirements.txt
```

Enable load generation against a frontend running on port 8080:

```sh
LOAD_GENERATOR_ENABLED=true FRONTEND_ADDR=localhost:8080 \
    sh src/loadgenerator/start.sh
```

Press Ctrl+C to stop generating traffic. To run the disabled startup check:

```sh
LOAD_GENERATOR_ENABLED=false sh src/loadgenerator/start.sh
```

Disabled mode exits immediately; it does not leave a process waiting to be enabled.
Changing the flag affects a new run, so stop an existing generator before starting
it with different settings.
