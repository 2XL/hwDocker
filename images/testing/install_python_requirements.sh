#!/bin/bash


#
# pip freeze > requirements.txt
#
pipreqs . --force

pip install -r requirements.txt
