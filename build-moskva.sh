#!/bin/bash
# Билд сайта для Москвы
set -e
echo "=== Билд для Москвы ==="
cp _data/cities/moskva.yml _data/city.yml
bundle exec jekyll build
echo "Готово: _site/ (Москва)"
