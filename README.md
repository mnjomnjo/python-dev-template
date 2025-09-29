# Python development project template

This template matches your requested workflow: `make` targets for venv, install, linting,
codestyle with `black`, unit tests with `unittest` + coverage, docs with `pdoc`, and diagrams
with `pyreverse`.

## Get going

### Check version of Python
The Makefile uses `PYTHON=python` by default.
```sh
make version
```
If your executable is named `python3`, set an environment variable first:
```sh
export PYTHON=python3
make version
```

### Python virtual environment
```sh
make venv
# Activate on Windows (PowerShell): .\.venv\Scripts\activate
# Activate on Linux/Mac:        . .venv/bin/activate
```
When you are done you can leave the venv with `deactivate`.

### Install the dependencies
```sh
make install
make installed
```

### Run the code
```sh
python guess/main.py
```

### Run the validators
```sh
make flake8
make pylint
# Or both:
make lint
```

### Codestyle with black
```sh
make black
make codestyle
```

### Run the unittests
```sh
make unittest        # without coverage
make coverage        # with coverage (also builds htmlcov)
make test            # lint + coverage
```
Open coverage report:
```sh
firefox htmlcov/index.html
```

### Run parts of the testsuite
```sh
python -m unittest tests.test_game
python -m unittest tests.test_game.TestGameClass.test_init_default_object
```

### Remove generated files
```sh
make clean
make clean-all
```

### More targets
```sh
make pyreverse   # generate class/package diagrams (requires Graphviz)
make doc         # generate API docs into ./docs using pdoc
```
