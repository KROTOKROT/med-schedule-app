package com.medapp.backend.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "medications")
public class Medication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String dosage;
    private String time;
    private String instructions;

    public Medication() {}

    public Medication(Long id, String name, String dosage, String time, String instructions) {
        this.id = id;
        this.name = name;
        this.dosage = dosage;
        this.time = time;
        this.instructions = instructions;
    }

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getDosage() { return dosage; }

    public void setDosage(String dosage) { this.dosage = dosage; }

    public String getTime() { return time; }

    public void setTime(String time) { this.time = time; }

    public String getInstructions() { return instructions; }

    public void setInstructions(String instructions) { this.instructions = instructions; }
}