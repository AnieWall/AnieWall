.PHONY: help install test clean

PYTHON ?= python

help:
	@echo "Repository development commands"
	@echo "  make install  - install the project in editable mode with test dependencies"
	@echo "  make test     - run the project test suite"
	@echo "  make clean    - remove Python cache and test artifacts"

install:
	$(PYTHON) -m pip install -e ".[dev]"

test:
	$(PYTHON) -m pytest tests/ -q

clean:
	$(PYTHON) -c "import pathlib, shutil; [shutil.rmtree(p, ignore_errors=True) for p in pathlib.Path('.').rglob('__pycache__')]; shutil.rmtree('.pytest_cache', ignore_errors=True)"
