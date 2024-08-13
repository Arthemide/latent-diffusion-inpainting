.PHONY: tests coverage

setup:
	poetry install -v --all-extras

check:
	pylint ldm
	black . --check
	isort . --check --gitignore
	flake8 ldm
	flake8 tests

lint:
	echo running black...
	black .
	echo running isort...
	isort . --gitignore
	echo running flake8...
	flake8 .
	echo running autoflake...
	autoflake -i --remove-all-unused-imports -r --ignore-init-module-imports . --exclude venv


lint-notebook:
	echo running black...
	nbqa black *.ipynb
	echo running isort...
	nbqa isort *.ipynb --gitignore
	echo running flake8...
	nbqa flake8 *.ipynb
	echo running autoflake...
	nbqa autoflake -i --remove-all-unused-imports *.ipynb