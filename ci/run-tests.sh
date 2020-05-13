#!/bin/bash
pip install pipenv
pipenv install --dev
echo pwd
pipenv run python -m pytest
