# 03. Database Design (Проектирование базы данных)

## 1. Общая информация

База данных системы MedSchedule построена на PostgreSQL и предназначена для хранения пользователей, лекарств, расписаний и истории приёма.

---

## 2. Основные сущности

### 2.1 User (Пользователь)
Хранит информацию о пользователях системы.

**Поля:**
- id (PK)
- name
- email (UNIQUE)
- password_hash

---

### 2.2 Medication (Лекарство)
Описание препарата, добавленного пользователем.

**Поля:**
- id (PK)
- user_id (FK → User)
- name
- dosage
- description

---

### 2.3 Schedule (Расписание приёма)
Определяет, когда нужно принимать лекарство.

**Поля:**
- id (PK)
- medication_id (FK → Medication)
- time
- frequency
- start_date
- end_date

---

### 2.4 IntakeRecord (Факт приёма)
Фиксация факта приёма лекарства.

**Поля:**
- id (PK)
- schedule_id (FK → Schedule)
- taken_at
- status (TAKEN / MISSED)

---

## 3. Связи между таблицами

- User 1 → N Medication
- Medication 1 → N Schedule
- Schedule 1 → N IntakeRecord

---

## 4. ER-диаграмма (логическая модель)

Система имеет следующую структуру:

- Пользователь создаёт лекарства
- Лекарства имеют расписания
- Расписания формируют историю приёма

(ER-диаграмма добавляется в виде изображения в docs/images/)

---

## 5. SQL (DDL)

```sql
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

CREATE TABLE medications (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id),
    name VARCHAR(255) NOT NULL,
    dosage VARCHAR(100),
    description TEXT
);

CREATE TABLE schedules (
    id BIGSERIAL PRIMARY KEY,
    medication_id BIGINT REFERENCES medications(id),
    time TIME NOT NULL,
    frequency VARCHAR(50),
    start_date DATE,
    end_date DATE
);

CREATE TABLE intake_records (
    id BIGSERIAL PRIMARY KEY,
    schedule_id BIGINT REFERENCES schedules(id),
    taken_at TIMESTAMP,
    status VARCHAR(20)
);