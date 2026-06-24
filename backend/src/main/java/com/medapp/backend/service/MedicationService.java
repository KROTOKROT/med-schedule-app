package com.medapp.backend.service;

import com.medapp.backend.entity.Medication;
import com.medapp.backend.repository.MedicationRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicationService {

    private final MedicationRepository repository;

    public MedicationService(MedicationRepository repository) {
        this.repository = repository;
    }

    public List<Medication> getAll() {
        return repository.findAll();
    }

    public Medication getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Medication not found"));
    }
    
    public Medication save(Medication medication) {
        return repository.save(medication);
    }

    public Medication update(Long id, Medication updated) {
        Medication m = getById(id);

        m.setName(updated.getName());
        m.setDosage(updated.getDosage());
        m.setTime(updated.getTime());
        m.setInstructions(updated.getInstructions());

        return repository.save(m);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
}