#!/bin/bash
pip install pipenv
pipenv install --dev
pipenv run python -m pytest
