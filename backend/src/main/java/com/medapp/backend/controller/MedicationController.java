package com.medapp.backend.controller;

import com.medapp.backend.entity.Medication;
import com.medapp.backend.service.MedicationService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/medications")
@CrossOrigin(origins = "*")
public class MedicationController {

    private final MedicationService service;

    public MedicationController(MedicationService service) {
        this.service = service;
    }

    @GetMapping
    public List<Medication> getAll() {
        return service.getAll();
    }

    @GetMapping("/{id}")
    public Medication getById(@PathVariable Long id) {
        return service.getById(id);
    }

    @PostMapping
    public Medication create(@RequestBody Medication medication) {
        return service.save(medication);
    }

    @PutMapping("/{id}")
    public Medication update(@PathVariable Long id,
                             @RequestBody Medication medication) {
        return service.update(id, medication);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        service.delete(id);
    }
}