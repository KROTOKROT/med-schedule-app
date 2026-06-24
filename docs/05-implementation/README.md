# 05. Implementation (Реализация системы)

## 1. Общая информация

MedSchedule — клиент-серверное мобильное приложение для управления расписанием приёма лекарств.

Система состоит из:
- Mobile клиент (Flutter)
- Backend сервер (Spring Boot)
- REST API взаимодействие (JSON + JWT)

---

## 2. Общая структура проекта

### Backend (Spring Boot)

backend/
 ├── controller/
 ├── service/
 ├── repository/
 ├── entity/
 ├── dto/
 ├── config/
 ├── security/

### Mobile (Flutter)

mobile/
 ├── presentation/
 ├── state_management/
 │    ├── view_model/
 │    ├── repository/
 │    └── entity/
 ├── api/
 ├── local_storage/

---

## 3. Реализация PCMEF (Backend)

- Presentation → REST Controllers
- Control → DTO + validation
- Mediator → Service layer (business logic)
- Entity → JPA entities
- Foundation → Spring Data repositories

---

## 4. Пример Entity (JPA)

@Entity
@Table(name = "medications")
public class Medication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String dosage;

    private String description;

    @ManyToOne
    private User user;
}

---

## 5. Пример Service (Mediator)

@Service
public class MedicationService {

    private final MedicationRepository repository;

    public MedicationService(MedicationRepository repository) {
        this.repository = repository;
    }

    public List<Medication> getAll() {
        return repository.findAll();
    }

    public Medication create(Medication med) {
        return repository.save(med);
    }
}

---

## 6. Пример Controller (Presentation)

@RestController
@RequestMapping("/api/medications")
public class MedicationController {

    private final MedicationService service;

    public MedicationController(MedicationService service) {
        this.service = service;
    }

    @GetMapping
    public List<Medication> getAll() {
        return service.getAll();
    }

    @PostMapping
    public Medication create(@RequestBody Medication med) {
        return service.create(med);
    }
}

---

## 7. Реализация PCMEF (Mobile)

- Presentation → UI (Flutter screens)
- Control → ViewModel / State management
- Mediator → Repository layer
- Entity → Models
- Foundation → API + local storage

---

## 8. Пример ViewModel (Flutter)

class MedicationViewModel {
  final MedicationRepository repository;

  MedicationViewModel(this.repository);

  Future<List<Medication>> getAll() async {
    return repository.getAll();
  }
}

---

## 9. REST API

- Base URL: /api
- Format: JSON
- Auth: JWT
- Communication: HTTP/HTTPS

---

## 10. Реализованные функции

- регистрация и авторизация
- добавление лекарств
- создание расписаний
- просмотр списка
- отметка приёма
- оффлайн-кэширование
- синхронизация с сервером

---

## 11. Вывод

Реализация соответствует архитектуре PCMEF и обеспечивает разделение логики между слоями и взаимодействие клиента и сервера через REST API.