#!/bin/bash
pip install pipenv
pipenv install --dev
pipenv run python -m pytest test_app.py
pipenv run python -m pytest ./lib/test_whoami.py
