# Аудит скилов и плагинов на примере создания Дез Обработка

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Найти логи сессии создания dez-obrabotka, отследить какие скилы/плагины реально вызывались, сравнить с планом, определить что заменить/доработать.

**Architecture:** Чтение JSONL-логов сессий → grep по вызовам Skill, plugin, ошибкам → сопоставление с планом из 7 шагов → таблица решений.

**Tech Stack:** grep по JSONL, анализ содержимого сообщений агента

---

### Task 1: Найти логи сессии создания

**Files:**
- Read: `C:\Users\Admin\.claude\projects\*\*.jsonl` — найти сессию с упоминаниями dez/obrabotka

- [ ] **Step 1: Определить какой jsonl — основная сессия создания**

Самый большой файл: `6f896515-4bef-41fe-b5c7-42953d607773.jsonl` (6760 строк) — вероятный кандидат.
Проверить: grep по "orchestrator\|Skill\|design-create\|writing-plans" в этом файле чтобы подтвердить что это сессия создания.

- [ ] **Step 2: Извлечь все вызовы скилов из основной сессии**

```bash
grep -E '"Skill"|"skill".*"orchestrator"|"skill".*"design-create"|"skill".*"validator"|"skill".*"design-review"|"skill".*"seo-expert"|"skill".*"verification"|"skill".*"brainstorming"|"skill".*"writing-plans"|"skill".*"prompt-first"|"skill".*"run"' session.jsonl
```

- [ ] **Step 3: Извлечь все ошибки и проблемы из сессии**

```bash
grep -E '"error"|"Error"|"fail"|"FAIL"|"denied"|"rejected"|"timeout"' session.jsonl
```

---

### Task 2: Сопоставить план vs факт

**Files:**
- Read: `C:\Users\Admin\Projects\dez-obrabotka\docs\superpowers\plans\2026-06-01-dez-obrabotka-landing.md` (план 7 шагов)

- [ ] **Step 1: Составить таблицу «Скил → План (да/нет) → Факт (да/нет) → Ошибки»**

Для каждого скила из плана:
| Скил | В плане | Вызван | Отработал | Ошибки |

- [ ] **Step 2: Отметить скилы которые были в плане но НЕ вызваны**

- [ ] **Step 3: Отметить скилы которые вызваны но отработали с ошибками**

---

### Task 3: Определить корневые причины

- [ ] **Step 1: Для каждого несработавшего скила — причина**

Варианты:
- Скил не установлен / отсутствует в системе
- Скил вызван но вернул ошибку
- Скил вызван но агент проигнорировал его инструкции
- Скил не вызывался (агент пропустил шаг)
- Плагин отключён / не загружен

- [ ] **Step 2: Для каждого частично сработавшего скила — что пропущено**

---

### Task 4: Итоговый отчёт

- [ ] **Step 1: Таблица решений**

| Скил | Статус | Решение | Причина |
|------|--------|---------|---------|

- [ ] **Step 2: Список плагинов которые не загрузились или отсутствовали**

- [ ] **Step 3: Рекомендации по оркестратору — какие проверки добавить между шагами**
