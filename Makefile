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

train:
	CUDA_VISIBLE_DEVICES=0 python main.py --base ldm/models/ldm/inpainting_big/config.yaml --resume ldm/models/ldm/inpainting_big/last.ckpt --stage 1 -t --gpus 0,
