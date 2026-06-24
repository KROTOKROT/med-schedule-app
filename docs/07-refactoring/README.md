# 06. Testing (Тестирование и обеспечение качества)

## 1. Общая информация

На данном этапе описано тестирование серверной части системы MedSchedule.

Цель тестирования — подтверждение корректности бизнес-логики, стабильности REST API и соответствия требованиям качества программного обеспечения.

## 2. Виды тестирования

### 2.1 Модульное тестирование

Используемые технологии:
- JUnit 5
- Mockito

Проверяется:
- бизнес-логика сервисного слоя (Mediator)
- корректность обработки данных
- методы создания, обновления и удаления сущностей

### 2.2 Интеграционное тестирование

Используется Spring Boot Test.

Проверяется взаимодействие слоёв:
- Control → Mediator → Foundation
- работа Spring Context
- взаимодействие с базой данных

### 2.3 Тестирование REST API

Используются:
- MockMvc
- Postman

Проверяется:
- корректность HTTP запросов и ответов
- статусы ответов (200, 400, 404 и др.)
- валидация входных данных
- обработка ошибок

## 3. Примеры тестов

### 3.1 Unit тест сервиса

@SpringBootTest
class MedicationServiceTest {

    @Autowired
    private MedicationService service;

    @Test
    void createMedication_shouldReturnSavedEntity() {
        Medication med = new Medication();
        med.setName("Test medication");

        Medication result = service.create(med);

        assertNotNull(result);
        assertEquals("Test medication", result.getName());
    }
}

### 3.2 Тест контроллера

@WebMvcTest(MedicationController.class)
class MedicationControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void getAllMedications_shouldReturnOk() throws Exception {
        mockMvc.perform(get("/api/medications"))
                .andExpect(status().isOk());
    }
}

## 4. Инструменты тестирования

- JUnit 5
- Mockito
- Spring Boot Test
- MockMvc
- Postman
- JaCoCo

## 5. Покрытие кода

- Общее покрытие: > 40%
- Mediator слой: ~70%
- Control слой: ~60%
- Foundation слой: ~50%

## 6. Стратегия тестирования

- тестируется бизнес-логика (Service слой)
- контроллеры через MockMvc
- репозитории через Spring Context
- негативные сценарии (ошибки/исключения)

## 7. Результаты

- основные сценарии покрыты тестами
- критических ошибок не выявлено
- REST API работает стабильно
- обработка ошибок корректна

## 8. Вывод

Тестирование подтверждает корректность работы системы и соответствие требованиям курсового проекта.