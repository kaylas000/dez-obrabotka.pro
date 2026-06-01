# Premium Redesign — Dez-obrabotka

## Цель
Полный редизайн сайта до премиум-уровня. 10 страниц, адаптивность, SVG-иконки, изображения, микро-анимации.

## Исходные данные
- design-dna.json: тёмная тема (base: #0B1120, accent: #10B981, accent_alt: #F59E0B)
- Шрифты: Space Grotesk (display), Inter (body), JetBrains Mono (цены)
- 10 страниц: лендинг, 7 услуг, блог, контакты, faq
- Jekyll 4.3, без плагинов
- Playwright MCP доступен для скриншотов

## Архитектура

### CSS
- Вынести из inline в отдельные файлы в assets/css/
- main.css — переменные, сброс, типографика, утилиты
- components.css — кнопки, карточки, таблицы, аккордеоны
- layout.css — header, footer, сетки, контейнеры
- Каждая страница: свой style-блок для уникальных секций (через frontmatter)

### Изображения и иконки
- SVG-иконки: инлайн в HTML, 24x24, stroke-based
- Изображения: seo-image-gen для hero-фона, оборудования, сертификатов
- favicon.svg

### Страницы (порядок реализации)
1. _layouts/default.html — базовый лейаут, CSS-система
2. _includes/header.html + footer.html
3. index.html — лендинг (9 секций)
4. uslugi/*/index.html — 7 страниц услуг
5. faq/index.html, contacts/index.html, blog/index.html

## Дизайн-решения
- Spacing: строгая шкала 4-8-16-24-32-48-64-96px
- Border-radius: 0-2-4px (не больше)
- Тени: только для интерактивных элементов, едва заметные
- Анимации: 200ms ease, только hover/focus/accordion
- Иконки: кастомные SVG под каждый раздел
- Типографика: модульная шкала (12-14-16-18-20-24-32-40-48-56px)
- Мобильные: брейкпоинты 480, 768, 1024, 1200

## Скилы для реализации
1. design-engine — создание блоков
2. high-end-visual-design — премиум-паттерны
3. refactoring-ui (01-10) — полировка
4. seo-image-gen — изображения
5. design-cycle — скриншоты + правки
6. css-micro-fx — микро-анимации
