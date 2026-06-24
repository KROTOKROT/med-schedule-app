# 10. Deployment (Развёртывание и запуск системы)

## 1. Общая информация

Данный раздел описывает процесс развертывания системы MedSchedule, включая серверную часть (Spring Boot), базу данных PostgreSQL и мобильное приложение.

Цель этапа — обеспечить воспроизводимый запуск системы в локальной и контейнеризированной среде.

---

## 2. Требования к окружению

| Компонент | Версия |
|-----------|--------|
| Java JDK | 17+ |
| PostgreSQL | 15+ |
| Docker | 20+ |
| Docker Compose | 2.x |
| Android Studio | latest |

---

## 3. Структура проекта

- backend/ — Spring Boot сервер
- mobile/ — Android/Flutter клиент
- docs/ — документация
- docker-compose.yml — конфигурация контейнеров

---

## 4. Локальный запуск без Docker

### 4.1 Запуск базы данных

Установить PostgreSQL и создать базу:

CREATE DATABASE medschedule;

---

### 4.2 Запуск backend

cd backend  
./mvnw spring-boot:run  

Сервер доступен:
http://localhost:8081

Swagger:
http://localhost:8081/swagger-ui.html

---

### 4.3 Запуск мобильного приложения

cd mobile  
flutter pub get  
flutter run  

или запуск через Android Studio.

---

## 5. Запуск через Docker

### 5.1 Сборка и запуск

docker-compose up --build -d  

---

### 5.2 Сервисы

- backend: http://localhost:8081  
- database: PostgreSQL (5432)  

---

## 6. Пример docker-compose.yml

version: '3.8'

services:
  db:
    image: postgres:15
    environment:
      POSTGRES_DB: medschedule
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: admin
    ports:
      - "5432:5432"

  backend:
    build: ./backend
    ports:
      - "8081:8081"
    depends_on:
      - db

---

## 7. Переменные окружения

DB_URL=jdbc:postgresql://localhost:5432/medschedule  
DB_USERNAME=admin  
DB_PASSWORD=admin  
JWT_SECRET=secret_key  
SERVER_PORT=8081  

---

## 8. CI/CD (опционально)

При расширении проекта возможно подключение:

- GitHub Actions
- автоматическая сборка Docker образов
- деплой на сервер

---

## 9. Проверка работоспособности

После запуска проверить:

- http://localhost:8081/api/health
- Swagger UI
- подключение к базе данных
- работу мобильного клиента

---

## 10. Возможные проблемы

- порт 8080 занят → изменить 8081  
- PostgreSQL не запускается → проверить credentials  
- Flutter не видит API → проверить IP backend  

---

## 11. Вывод

Система успешно разворачивается локально и в Docker-среде, поддерживает воспроизводимый запуск и масштабирование.