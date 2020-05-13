#!/bin/bash
pip install pipenv
pipenv install --dev
pwd
pipenv run python -m pytest
