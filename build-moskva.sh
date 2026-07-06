#!/bin/bash
# Билд сайта для Москвы
# Замена всех упоминаний Пензы на Москву + московские телефоны
set -e

echo "=== Билд для Москвы ==="

# Создаём временную копию
rm -rf _build-moskva
cp -r . _build-moskva
cd _build-moskva

# Замены в HTML и YAML файлах
find . -name "*.html" -o -name "*.yml" -o -name "*.md" | while read f; do
  sed -i \
    -e 's/По Пензе/По Москвы/g' \
    -e 's/Пензенская/Московская/g' \
    -e 's/В Пензе/В Москве/g' \
    -e 's/в Пензе/в Москве/g' \
    -e 's/Пензы/Москвы/g' \
    -e 's/Пенза/Москва/g' \
    -e 's/+7 (8412) 25-01-77/+7 (495) 123-45-67/g' \
    -e 's/78412250177/74951234567/g' \
    -e 's/disinfection58@rambler.ru/mchodob@yandex.ru/g' \
    -e 's|https://dez-obrabotka.pro|https://moskva.dez-obrabotka.pro|g' \
    -e 's/Ленинский/ЦАО/g' \
    -e 's/Октябрьский/САО/g' \
    -e 's/Первомайский/ЮВАО/g' \
    -e 's/Железнодорожный/ЮЗАО/g' \
    -e 's/Арбеково/ЗАО/g' \
    -e 's/Терновка/ТиНАО/g' \
    -e 's/Засечное/МО/g' \
    -e 's/Спутник/СЗАО/g' \
    "$f"
done

# Собираем
bundle exec jekyll build

# Копируем результат
rm -rf ../_site-moskva
cp -r _site ../_site-moskva
cd ..
rm -rf _build-moskva

echo "Готово: _site-moskva/"
