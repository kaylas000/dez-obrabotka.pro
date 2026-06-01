# Dez-obrabotka

## Tech Stack
- Jekyll (SSG)
- Ruby (Gemfile)

## Структура
- `_layouts/` — шаблоны Liquid
- `_includes/` — переиспользуемые компоненты
- `_data/` — данные (JSON/YAML)
- `_site/` — собранный сайт (не редактировать)
- `blog/`, `contacts/`, `faq/`, `uslugi/` — разделы сайта (Jekyll collections)
- `design-dna.json` — дизайн-токены бренда

## Дизайн-система
- Файл `design-dna.json` содержит токены бренда. Используй его при любых дизайн-задачах.
- При дизайне: сначала прочитай `design-dna.json`, затем создавай/правь страницы.

## Правила
- Отвечай на русском. Код и технические термины — на английском.
- Перед началом работы проверь доступные скилы (Skill tool).
- Дизайн: используй design-engine или design-cycle с Playwright для скриншотов.
- После изменения кода → validator.
- Перед «готово» → verification-before-completion.
- Поиск по коду → делегируй cavecrew-investigator (Agent).
- Jekyll: `bundle exec jekyll serve` для локального запуска.

## Экономия токенов
- Read только перед Edit.
- Не перечитывай файлы без причины.
- Поиск → sub-agent.
