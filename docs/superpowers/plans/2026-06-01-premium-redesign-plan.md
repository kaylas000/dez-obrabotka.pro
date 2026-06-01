# Premium Redesign — Dez-obrabotka Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Полный редизайн сайта dez-obrabotka.pro до премиум-уровня с адаптивностью, SVG-иконками, изображениями, микро-анимациями.

**Architecture:** CSS-фреймворк из 3 файлов (main/components/layout), один лейаут, 2 инклуда, 10 страниц. Все стили выносятся из inline в assets/css/. Изображения через seo-image-gen. Иконки — инлайн SVG.

**Tech Stack:** Jekyll 4.3, CSS custom properties, Intersection Observer, CSS-only animations, Playwright для проверки.

**Source:** `docs/superpowers/specs/2026-06-01-premium-redesign-design.md`

---

## File Structure

| File | Action | Purpose |
|------|--------|---------|
| `assets/css/main.css` | Create | CSS-переменные, reset, типографика, spacing-шкала, цвета |
| `assets/css/layout.css` | Create | Контейнер, сетки, header, footer, секции |
| `assets/css/components.css` | Create | Кнопки, карточки, таблицы, аккордеоны, формы, бейджи |
| `_layouts/default.html` | Modify | Новый лейаут, подключает CSS-файлы, Schema.org |
| `_includes/header.html` | Modify | Премиум-хедер: лого, навигация, телефон |
| `_includes/footer.html` | Modify | Премиум-футер: 4 колонки, соцсети |
| `assets/img/` | Create dir | Изображения |
| `_includes/icons/` | Create dir | SVG-иконки как инклуды |
| `index.html` | Modify | Полный редизайн лендинга |
| `uslugi/*/index.html` | Modify ×7 | Шаблон страницы услуги |
| `faq/index.html` | Modify | FAQ-страница |
| `contacts/index.html` | Modify | Контакты |
| `blog/index.html` | Modify | Блог-листинг |
| `favicon.svg` | Create | SVG-фавикон |

---

### Task 1: CSS Foundation — main.css

**Files:**
- Create: `assets/css/main.css`

- [ ] **Step 1: Создать main.css с переменными и сбросом**

```css
/* ===== CSS Custom Properties ===== */
:root {
  /* Colors — from design-dna.json */
  --color-base: #0B1120;
  --color-surface: #151E2D;
  --color-accent: #10B981;
  --color-accent-alt: #F59E0B;
  --color-text: #F1F5F9;
  --color-text-muted: #94A3B8;
  --color-border: #1E293B;
  --color-success: #10B981;
  --color-danger: #EF4444;

  /* Typography */
  --font-display: 'Space Grotesk', system-ui, sans-serif;
  --font-body: 'Inter', system-ui, sans-serif;
  --font-mono: 'JetBrains Mono', monospace;

  /* Modular scale */
  --text-xs: 0.75rem;    /* 12px */
  --text-sm: 0.875rem;   /* 14px */
  --text-base: 1rem;     /* 16px */
  --text-lg: 1.125rem;   /* 18px */
  --text-xl: 1.25rem;    /* 20px */
  --text-2xl: 1.5rem;    /* 24px */
  --text-3xl: 2rem;      /* 32px */
  --text-4xl: 2.5rem;    /* 40px */
  --text-5xl: 3rem;      /* 48px */
  --text-6xl: 3.5rem;    /* 56px */

  /* Spacing scale */
  --space-0: 0;
  --space-1: 0.25rem;    /* 4px */
  --space-2: 0.5rem;     /* 8px */
  --space-3: 0.75rem;    /* 12px */
  --space-4: 1rem;       /* 16px */
  --space-5: 1.5rem;     /* 24px */
  --space-6: 2rem;       /* 32px */
  --space-7: 3rem;       /* 48px */
  --space-8: 4rem;       /* 64px */
  --space-9: 6rem;       /* 96px */

  /* Layout */
  --max-width: 1200px;
  --radius-sm: 2px;
  --radius: 4px;
  --radius-none: 0;

  /* Focus */
  --focus-outline: 3px solid var(--color-accent);
  --focus-offset: 2px;

  /* Transitions */
  --transition: 200ms ease;
}

/* ===== Reset ===== */
*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html {
  font-size: 16px;
  scroll-behavior: smooth;
  -webkit-text-size-adjust: 100%;
}

body {
  font-family: var(--font-body);
  font-size: var(--text-base);
  line-height: 1.6;
  color: var(--color-text);
  background-color: var(--color-base);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

img, svg, video {
  display: block;
  max-width: 100%;
}

a {
  color: var(--color-accent);
  text-decoration: none;
  transition: color var(--transition);
}

a:hover {
  color: color-mix(in srgb, var(--color-accent) 80%, white);
}

/* ===== Typography ===== */
h1, h2, h3, h4, h5, h6 {
  font-family: var(--font-display);
  font-weight: 600;
  line-height: 1.2;
  letter-spacing: -0.02em;
}

h1 { font-size: var(--text-6xl); }
h2 { font-size: var(--text-4xl); }
h3 { font-size: var(--text-2xl); }
h4 { font-size: var(--text-xl); }

p + p { margin-top: var(--space-4); }

/* ===== Focus ===== */
:focus-visible {
  outline: var(--focus-outline);
  outline-offset: var(--focus-offset);
}

/* ===== Reduced motion ===== */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}

/* ===== Selection ===== */
::selection {
  background: var(--color-accent);
  color: var(--color-base);
}

/* ===== Scrollbar ===== */
::-webkit-scrollbar { width: 8px; }
::-webkit-scrollbar-track { background: var(--color-base); }
::-webkit-scrollbar-thumb {
  background: var(--color-border);
  border-radius: var(--radius);
}
::-webkit-scrollbar-thumb:hover { background: var(--color-text-muted); }
```

- [ ] **Step 2: Commit**

```bash
git add assets/css/main.css
git commit -m "feat: add CSS foundation with variables, reset, typography

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
```

---

### Task 2: CSS Layout System — layout.css

**Files:**
- Create: `assets/css/layout.css`

- [ ] **Step 1: Написать layout.css**

```css
/* ===== Container ===== */
.container {
  width: 100%;
  max-width: var(--max-width);
  margin-inline: auto;
  padding-inline: var(--space-5);
}

.container--narrow {
  max-width: 800px;
}

.container--wide {
  max-width: 1400px;
}

/* ===== Section ===== */
.section {
  padding-block: var(--space-9);
}

.section--sm { padding-block: var(--space-7); }
.section--lg { padding-block: 8rem; }

.section__header {
  text-align: center;
  max-width: 700px;
  margin-inline: auto;
  margin-bottom: var(--space-7);
}

.section__label {
  display: inline-block;
  font-family: var(--font-mono);
  font-size: var(--text-sm);
  color: var(--color-accent);
  text-transform: uppercase;
  letter-spacing: 0.1em;
  margin-bottom: var(--space-3);
}

.section__title {
  margin-bottom: var(--space-4);
}

.section__subtitle {
  font-size: var(--text-lg);
  color: var(--color-text-muted);
  max-width: 560px;
  margin-inline: auto;
}

/* ===== Grid systems ===== */
.grid {
  display: grid;
  gap: var(--space-5);
}

.grid--2 { grid-template-columns: repeat(2, 1fr); }
.grid--3 { grid-template-columns: repeat(3, 1fr); }
.grid--4 { grid-template-columns: repeat(4, 1fr); }

/* Auto-fit grid — адаптивная */
.grid--auto {
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
}

@media (max-width: 1024px) {
  .grid--4 { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 768px) {
  .section { padding-block: var(--space-7); }
  .grid--3 { grid-template-columns: repeat(2, 1fr); }
  .grid--2 { grid-template-columns: 1fr; }
}

@media (max-width: 480px) {
  .container { padding-inline: var(--space-4); }
  .section { padding-block: var(--space-6); }
  .grid--3, .grid--4 { grid-template-columns: 1fr; }
  h1 { font-size: var(--text-4xl); }
  h2 { font-size: var(--text-3xl); }
}

/* ===== Flex utilities ===== */
.flex { display: flex; }
.flex--center { align-items: center; justify-content: center; }
.flex--between { align-items: center; justify-content: space-between; }
.flex--wrap { flex-wrap: wrap; }
.flex--gap { gap: var(--space-4); }

/* ===== Spacing utilities ===== */
.mt-1 { margin-top: var(--space-1); }
.mt-4 { margin-top: var(--space-4); }
.mt-6 { margin-top: var(--space-6); }
.mb-4 { margin-bottom: var(--space-4); }
.mb-6 { margin-bottom: var(--space-6); }
/* ... complete scale in full file ... */
```

- [ ] **Step 2: Commit**

---

### Task 3: CSS Components — components.css

**Files:**
- Create: `assets/css/components.css`

- [ ] **Step 1: Написать все компоненты**

```css
/* ===== Buttons ===== */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-2);
  font-family: var(--font-display);
  font-size: var(--text-base);
  font-weight: 600;
  padding: var(--space-3) var(--space-5);
  border: 2px solid transparent;
  border-radius: var(--radius);
  cursor: pointer;
  transition: all var(--transition);
  text-decoration: none;
  line-height: 1;
}

.btn--primary {
  background: var(--color-accent-alt);
  color: var(--color-base);
}

.btn--primary:hover {
  background: color-mix(in srgb, var(--color-accent-alt) 85%, white);
  transform: translateY(-1px);
}

.btn--outline {
  background: transparent;
  border-color: var(--color-accent);
  color: var(--color-accent);
}

.btn--outline:hover {
  background: var(--color-accent);
  color: var(--color-base);
}

.btn--ghost {
  background: transparent;
  color: var(--color-text);
}

.btn--ghost:hover {
  background: var(--color-surface);
}

.btn--lg {
  padding: var(--space-4) var(--space-6);
  font-size: var(--text-lg);
}

/* ===== Cards ===== */
.card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius);
  padding: var(--space-6);
  transition: border-color var(--transition);
}

.card:hover {
  border-color: var(--color-accent);
}

.card--link {
  text-decoration: none;
  color: inherit;
  display: block;
}

.card__icon {
  width: 48px;
  height: 48px;
  margin-bottom: var(--space-4);
  color: var(--color-accent);
}

.card__title {
  font-family: var(--font-display);
  font-size: var(--text-xl);
  margin-bottom: var(--space-2);
}

.card__text {
  color: var(--color-text-muted);
  font-size: var(--text-sm);
}

/* ===== Price Table ===== */
.table-wrapper {
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
}

.table {
  width: 100%;
  border-collapse: collapse;
}

.table th {
  font-family: var(--font-display);
  font-size: var(--text-sm);
  color: var(--color-text-muted);
  text-transform: uppercase;
  letter-spacing: 0.05em;
  text-align: left;
  padding: var(--space-4) var(--space-5);
  border-bottom: 2px solid var(--color-border);
  background: var(--color-base);
  position: sticky;
  top: 0;
}

.table td {
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
}

.table tr:hover td {
  background: var(--color-surface);
}

.table .price {
  font-family: var(--font-mono);
  color: var(--color-accent-alt);
  font-weight: 500;
}

/* ===== Accordion ===== */
.accordion {
  border: 1px solid var(--color-border);
  border-radius: var(--radius);
  overflow: hidden;
}

.accordion__item {
  border-bottom: 1px solid var(--color-border);
}

.accordion__item:last-child {
  border-bottom: none;
}

.accordion__trigger {
  width: 100%;
  background: none;
  border: none;
  padding: var(--space-5);
  font-family: var(--font-display);
  font-size: var(--text-base);
  color: var(--color-text);
  text-align: left;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: var(--space-4);
  transition: background var(--transition);
}

.accordion__trigger:hover {
  background: var(--color-surface);
}

.accordion__trigger::after {
  content: '+';
  font-family: var(--font-mono);
  font-size: var(--text-xl);
  color: var(--color-accent);
  transition: transform var(--transition);
}

details[open] .accordion__trigger::after {
  content: '−';
}

.accordion__content {
  padding: 0 var(--space-5) var(--space-5);
  color: var(--color-text-muted);
  line-height: 1.7;
}

/* ===== Badge ===== */
.badge {
  display: inline-block;
  font-family: var(--font-mono);
  font-size: var(--text-xs);
  padding: var(--space-1) var(--space-2);
  border-radius: var(--radius-sm);
  border: 1px solid var(--color-border);
}

.badge--accent {
  border-color: var(--color-accent);
  color: var(--color-accent);
}

/* ===== Divider ===== */
.divider {
  height: 1px;
  background: var(--color-border);
  border: none;
  margin-block: var(--space-6);
}

/* ===== Phone link ===== */
.phone-link {
  font-family: var(--font-mono);
  font-size: var(--text-lg);
  color: var(--color-accent-alt);
  font-weight: 500;
  white-space: nowrap;
}

.phone-link:hover {
  color: color-mix(in srgb, var(--color-accent-alt) 80%, white);
}

/* ===== Feature list ===== */
.feature-list {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: var(--space-4);
}

.feature-list__item {
  display: flex;
  align-items: flex-start;
  gap: var(--space-3);
}

.feature-list__icon {
  flex-shrink: 0;
  width: 24px;
  height: 24px;
  color: var(--color-accent);
  margin-top: 2px;
}

/* ===== Hero ===== */
.hero {
  padding-block: var(--space-9);
  position: relative;
  overflow: hidden;
}

.hero__content {
  max-width: 650px;
}

.hero__title {
  margin-bottom: var(--space-5);
}

.hero__subtitle {
  font-size: var(--text-lg);
  color: var(--color-text-muted);
  margin-bottom: var(--space-6);
  max-width: 520px;
}

.hero__actions {
  display: flex;
  gap: var(--space-4);
  flex-wrap: wrap;
}

/* ===== CTA Block ===== */
.cta {
  background: var(--color-surface);
  border: 1px solid var(--color-accent);
  border-radius: var(--radius);
  padding: var(--space-7);
  text-align: center;
}

.cta__title {
  margin-bottom: var(--space-3);
}

.cta__text {
  color: var(--color-text-muted);
  margin-bottom: var(--space-5);
  max-width: 480px;
  margin-inline: auto;
}

.cta__actions {
  display: flex;
  gap: var(--space-4);
  justify-content: center;
  flex-wrap: wrap;
}

/* ===== Numbered steps ===== */
.steps {
  counter-reset: step;
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: var(--space-6);
}

.steps__item {
  counter-increment: step;
  display: flex;
  gap: var(--space-5);
  align-items: flex-start;
}

.steps__item::before {
  content: counter(step, decimal-leading-zero);
  font-family: var(--font-display);
  font-size: var(--text-4xl);
  font-weight: 700;
  color: var(--color-accent);
  line-height: 1;
  opacity: 0.3;
  flex-shrink: 0;
}

/* ===== Image wrapper ===== */
.image-wrapper {
  position: relative;
  border-radius: var(--radius);
  overflow: hidden;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
}

.image-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* ===== Scroll reveal ===== */
.reveal {
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 0.6s ease, transform 0.6s ease;
}

.reveal--visible {
  opacity: 1;
  transform: translateY(0);
}

@media (prefers-reduced-motion: reduce) {
  .reveal {
    opacity: 1;
    transform: none;
    transition: none;
  }
}
```

- [ ] **Step 2: Commit**

---

### Task 4: SVG Icon System

**Files:**
- Create: `_includes/icons/` directory with individual SVG files

- [ ] **Step 1: Создать иконки**

Создать SVG-файлы: `shield.svg`, `droplet.svg`, `clock.svg`, `document.svg`, `phone.svg`, `map-pin.svg`, `mail.svg`, `chevron-right.svg`, `check.svg`, `plus.svg`, `target.svg`, `home.svg`, `spray.svg`, `bug.svg`, `award.svg`, `users.svg`, `tool.svg`

Каждая иконка:
```svg
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
     fill="none" stroke="currentColor" stroke-width="2"
     stroke-linecap="round" stroke-linejoin="round">
  <!-- icon paths -->
</svg>
```

- [ ] **Step 2: Commit**

---

### Task 5: New Layout — _layouts/default.html

**Files:**
- Modify: `_layouts/default.html`

- [ ] **Step 1: Полный rewrite лейаута**

```html
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{% if page.title %}{{ page.title }} | {{ site.title }}{% else %}{{ site.title }} — {{ site.description }}{% endif %}</title>
  <meta name="description" content="{% if page.description %}{{ page.description }}{% else %}{{ site.description }}{% endif %}">

  <!-- Preload fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&family=Space+Grotesk:wght@500;600;700&display=swap" rel="stylesheet">

  <!-- CSS -->
  <link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/layout.css' | relative_url }}">
  <link rel="stylesheet" href="{{ '/assets/css/components.css' | relative_url }}">

  <!-- Page-specific CSS -->
  {% if page.style %}
  <style>{{ page.style }}</style>
  {% endif %}

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="{{ '/favicon.svg' | relative_url }}">

  <!-- Schema.org -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    "name": "{{ site.title }}",
    "description": "{{ site.description }}",
    "url": "{{ site.url }}",
    "telephone": "+78412250177",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Пенза"
    },
    "openingHours": "Mo-Su 00:00-23:59",
    "priceRange": "от 1600₽"
  }
  </script>
</head>
<body>
  {% include header.html %}

  <main>
    {{ content }}
  </main>

  {% include footer.html %}

  <!-- Scroll reveal -->
  <script>
  (function() {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('reveal--visible');
        }
      });
    }, { threshold: 0.1 });

    document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
  })();
  </script>
</body>
</html>
```

- [ ] **Step 2: Commit**

---

### Task 6: Premium Header — _includes/header.html

**Files:**
- Modify: `_includes/header.html`

- [ ] **Step 1: Rewrite header**

Детальная реализация: sticky header с blur-бэкграундом, десктопная навигация с выпадающим меню услуг, мобильное гамбургер-меню на CSS (без JS), телефон.

- [ ] **Step 2: Commit**

---

### Task 7: Premium Footer — _includes/footer.html

**Files:**
- Modify: `_includes/footer.html`

- [ ] **Step 1: Rewrite footer**

4-колоночный грид: бренд + описание, услуги (список), информация (faq/блог/контакты/политика), контакты. SVG-иконки соцсетей.

- [ ] **Step 2: Commit**

---

### Task 8: Landing Page — index.html

**Files:**
- Modify: `index.html`

- [ ] **Step 1: Полный rewrite лендинга**

9 секций с полной вёрсткой: Hero, Услуги, Технология, Безопасность, Цены, Как работаем, FAQ, CTA, Футер. Каждая секция с `reveal`-анимацией. SVG-иконки в карточках услуг. Таблица цен с sticky header.

- [ ] **Step 2: Проверка скриншотом через Playwright**

- [ ] **Step 3: Commit**

---

### Task 9: Service Pages — uslugi/*/index.html (×7)

**Files:**
- Modify: `uslugi/tarakany/index.html`
- Modify: `uslugi/klopy/index.html`
- Modify: `uslugi/muravi/index.html`
- Modify: `uslugi/blohi/index.html`
- Modify: `uslugi/kleshchi/index.html`
- Modify: `uslugi/muhi/index.html`
- Modify: `uslugi/gryzuny/index.html`

- [ ] **Step 1: Создать единый премиум-шаблон для всех услуг**

Структура: заголовок, описание проблемы, как уничтожаем (3 шага с иконками), таблица цен, CTA, преимущества (карточки), FAQ по конкретному виду.

- [ ] **Step 2: Проверка скриншотом**

- [ ] **Step 3: Commit all 7**

---

### Task 10: Остальные страницы

**Files:**
- Modify: `faq/index.html`
- Modify: `contacts/index.html`
- Modify: `blog/index.html`

- [ ] **Step 1: FAQ — стилизованный аккордеон с 10 вопросами**

- [ ] **Step 2: Контакты — карточки с иконками, карта, форма**

- [ ] **Step 3: Блог — сетка карточек-заглушек**

- [ ] **Step 4: Commit**

---

### Task 11: Генерация изображений

**Files:**
- Create: `assets/img/hero-bg.webp`
- Create: `assets/img/equipment.webp`
- Create: `assets/img/certificate-1.webp`
- Create: `assets/img/certificate-2.webp`
- Create: `favicon.svg`

- [ ] **Step 1: Использовать seo-image-gen для генерации изображений**

- [ ] **Step 2: Commit**

---

### Task 12: Финальная полировка — refactoring-ui

- [ ] **Step 1: 01-establish-visual-hierarchy** — проверить иерархию на всех страницах
- [ ] **Step 2: 02-apply-typography-scale** — проверить типографику
- [ ] **Step 3: 03-build-color-palette** — сверить палитру с design-dna.json
- [ ] **Step 4: 04-apply-consistent-spacing** — проверить каждый отступ
- [ ] **Step 5: 05-design-button-hierarchy** — проверить иерархию кнопок
- [ ] **Step 6: 06-eliminate-visual-clutter** — убрать лишнее
- [ ] **Step 7: 08-use-shadows-appropriately** — проверить тени
- [ ] **Step 8: 09-manage-color-contrast** — проверить контраст
- [ ] **Step 9: 10-group-related-elements** — проверить группировку
- [ ] **Step 10: Скриншот всех страниц на 3 разрешениях (375, 768, 1440)**

---

### Task 13: Финальная проверка

- [ ] **Step 1: `bundle exec jekyll build` — сборка без ошибок**
- [ ] **Step 2: Скриншоты всех 10 страниц**
- [ ] **Step 3: Commit**
