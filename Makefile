# Cross-platform Makefile for Python dev workflow
    # Override with: PYTHON=python3 make <target>
    PYTHON ?= python

    # Detect platform specifics
    ifeq ($(OS),Windows_NT)
        ACTIVATE = . .venv/Scripts/activate
        PYTHON_BIN = .venv/Scripts/python
        PIP_BIN = .venv/Scripts/pip
    else
        ACTIVATE = . .venv/bin/activate
        PYTHON_BIN = .venv/bin/python
        PIP_BIN = .venv/bin/pip
    endif

    .PHONY: version venv install installed run flake8 pylint lint black codestyle unittest coverage test pyreverse doc clean clean-all

    version:
    	$(PYTHON) --version

    venv:
    	$(PYTHON) -m venv .venv
    	@echo "Activate with: $(ACTIVATE)"

    install: venv
    	$(PIP_BIN) install --upgrade pip
    	$(PIP_BIN) install -r requirements.txt

    installed:
    	$(PIP_BIN) list

    run:
    	$(PYTHON_BIN) guess/main.py

    flake8:
    	$(PYTHON_BIN) -m flake8 guess

    pylint:
    	$(PYTHON_BIN) -m pylint guess

    lint: flake8 pylint

    black:
    	$(PYTHON_BIN) -m black guess tests

    codestyle: black

    unittest:
    	$(PYTHON_BIN) -m unittest discover -s tests -p "test_*.py" -v

    coverage:
    	$(PYTHON_BIN) -m coverage run -m unittest discover -s tests -p "test_*.py"
    	$(PYTHON_BIN) -m coverage html
    	$(PYTHON_BIN) -m coverage report -m

    test: lint coverage

    # Requires Graphviz installed for PNG output
    pyreverse:
    	$(PYTHON_BIN) -m pylint.pyreverse -o png -p guess guess

    # Generate API docs into ./docs
    doc:
    	$(PYTHON_BIN) -m pdoc -o docs guess

    # Cross-platform cleanup using an inline Python script
    clean:
    	$(PYTHON) - <<'PY'
import os, shutil, glob
paths=['.pytest_cache','.mypy_cache','.pylint.d','htmlcov','.coverage','docs']
for p in paths:
    shutil.rmtree(p, ignore_errors=True)
for d in glob.glob('**/__pycache__', recursive=True):
    shutil.rmtree(d, ignore_errors=True)
PY

    clean-all: clean
    	$(PYTHON) - <<'PY'
import shutil; shutil.rmtree('.venv', ignore_errors=True)
PY
