# Система расписания приёма лекарств (Medication Schedule App)

**Автор:** Винник Константин Игоревич 
**Группа:** [ПИЖ-б-о-23-2]  
**Траектория:** Mobile  
**Дата начала:** 05.03.2026  
**Дата сдачи:** 30.05.2026

---

## Описание проекта

Система расписания приёма лекарств — это мобильное клиент-серверное приложение, предназначенное для автоматизации контроля приёма лекарственных препаратов. Система позволяет пользователю создавать персональные расписания приёма лекарств, получать уведомления о необходимости приёма, а также вести историю приёма.

---

## Траектория выполнения

- [ ] Веб-разработка  
- [ ] Десктоп  
- [x] Мобильная разработка (Flutter + Spring Boot)  
- [ ] Enterprise  

---

## Технологический стек

| Компонент | Технология |
|----------|------------|
| Клиент | Flutter, Dart |
| State Management | Provider / BLoC |
| HTTP | Dio |
| Локальное хранилище | SQLite / Hive |
| Сервер | Java 17, Spring Boot |
| Безопасность | Spring Security, JWT |
| База данных | PostgreSQL |
| ORM | Spring Data JPA |
| API | REST, OpenAPI (Swagger) |
| Сборка | Maven |

---

## Требования к окружению

| Компонент | Версия |
|----------|--------|
| Java JDK | 17+ |
| Flutter | 3.x+ |
| PostgreSQL | 15+ |
| Maven | 3.8+ |

---

## Установка и запуск

### 1. Клонирование репозитория

```bash
git clone https://github.com/KROTOKROT/med-schedule-app.git
cd med-schedule-app
```

---

### 2. Запуск backend

```bash
cd backend
./mvnw spring-boot:run
```

Сервер запускается на:
http://localhost:8081

Swagger UI:
http://localhost:8081/swagger-ui.html

---

### 3. Запуск mobile приложения

```bash
cd frontend
flutter pub get
flutter run
```

---

## API Endpoints

| Метод | Endpoint | Описание | Доступ |
|------|----------|----------|--------|
| POST | /auth/register | Регистрация пользователя | Public |
| POST | /auth/login | Авторизация | Public |
| GET | /users/me | Профиль пользователя | USER |
| GET | /medications | Получение списка лекарств | USER |
| POST | /medications | Создание лекарства | USER |
| PUT | /medications/{id} | Обновление лекарства | USER |
| DELETE | /medications/{id} | Удаление лекарства | USER |
| GET | /schedule/today | Расписание на день | USER |

---

## Архитектура (PCMEF)

Система построена на архитектурном паттерне PCMEF:

- **Presentation** — UI (Flutter)
- **Control** — REST Controllers (Spring Boot)
- **Mediator** — бизнес-логика (Service слой)
- **Entity** — доменные сущности (JPA)
- **Foundation** — слой доступа к данным (Repository)

Принцип архитектуры:  
Зависимости направлены строго сверху вниз (P → C → M → E → F)

---

## Структура проекта

```
backend/
frontend/
docs/
README.md
```

---

## Статистика разработки

## Документация проекта

Вся документация находится в директории `docs/`:

- 00-project-charter — паспорт проекта, бизнес-анализ
- 01-requirements — требования, Use Case, Domain Model
- 02-architecture — PCMEF, ADR
- 03-database — ER-диаграммы, DDL
- 04-detailed-design — диаграммы последовательностей
- 05-implementation — реализация системы
- 06-testing — тестирование и покрытие
- 07-refactoring — рефакторинг
- 08-ui — интерфейсы
- 09-api — Swagger, API описание
- 10-deployment — Docker, запуск
- 11-user-guide — руководство пользователя
- 12-final-report — итоговая пояснительная записка

---

## Автор

**Винник Константин Игоревич** — разработчик, документация 
Группа [ПИЖ-б-о-23-2] · Email: [konstantinv763@gmail.com] · GitHub: [KROTOKROT]

---

## Лицензия

MIT License