#!/bin/bash
# Билд сайта для Пензы
set -e
echo "=== Билд для Пензы ==="
cp _data/cities/penza.yml _data/city.yml
bundle exec jekyll build
echo "Готово: _site/ (Пенза)"
