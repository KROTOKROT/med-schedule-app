# 09. API (REST API и Swagger документация)

## 1. Общая информация

На данном этапе описан REST API серверной части системы MedSchedule.

API обеспечивает взаимодействие мобильного клиента с сервером, включая аутентификацию, управление пользователями, лекарствами и расписанием.

Документация реализована через Swagger (OpenAPI).

---

## 2. Базовый URL

http://localhost:8081/api

---

## 3. Архитектура API

API построено по REST принципам:

- GET — получение данных
- POST — создание данных
- PUT — обновление данных
- DELETE — удаление данных

---

## 4. Эндпоинты

### 4.1 Аутентификация
POST /auth/register — регистрация  
POST /auth/login — вход  
POST /auth/refresh — обновление токена  
POST /auth/logout — выход  

---

### 4.2 Пользователи
GET /users/me — профиль пользователя  
PUT /users/me — обновление профиля  

---

### 4.3 Лекарства
GET /medications — список лекарств  
GET /medications/{id} — получить по id  
POST /medications — создать  
PUT /medications/{id} — обновить  
DELETE /medications/{id} — удалить  

---

### 4.4 Расписание
GET /schedule — получить расписание  
POST /schedule — создать запись  
PUT /schedule/{id} — обновить  
DELETE /schedule/{id} — удалить  

---

### 4.5 Уведомления
GET /notifications — список уведомлений  
POST /notifications/test — тестовое уведомление  

---

## 5. Swagger

Swagger UI:
http://localhost:8081/swagger-ui.html

Возможности:
- тестирование API
- просмотр моделей
- проверка ответов

---

## 6. Пример запроса

POST /auth/register

{
  "email": "test@mail.com",
  "password": "123456"
}

---

## 7. Ответ

{
  "id": 1,
  "email": "test@mail.com",
  "token": "jwt_token_here"
}

---

## 8. Безопасность

- JWT авторизация  
- BCrypt пароли  
- роли USER / ADMIN  

---

## 9. Соответствие требованиям

- 8+ эндпоинтов  
- Swagger документация  
- JWT  
- CRUD операции  

---

## 10. Вывод

REST API обеспечивает полное взаимодействие мобильного клиента и серверной части.