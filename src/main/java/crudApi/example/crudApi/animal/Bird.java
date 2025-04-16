package crudApi.example.crudApi.animal;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "birds")
public class Bird {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Long birdId;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private String imagePath;

    @Column(nullable = false)
    private String habitat;

    @Column(nullable = false)
    private String diet;

    @Column(nullable = false)
    private String conservationStatus;

    @Column(nullable = false)
    private LocalDateTime createdAt;

    public Bird() {
        this.createdAt = LocalDateTime.now();
    }

    public Bird(Long birdId, String name, String description, String imagePath, String habitat, String diet, String conservationStatus, LocalDateTime createdAt) {
        this.birdId = birdId;
        this.name = name;
        this.description = description;
        this.imagePath = imagePath;
        this.habitat = habitat;
        this.diet = diet;
        this.conservationStatus = conservationStatus;
        this.createdAt = createdAt != null ? createdAt : LocalDateTime.now();
    }

    public Bird(String name, String description, String imagePath, String habitat, String diet, String conservationStatus) {
        this.name = name;
        this.description = description;
        this.imagePath = imagePath;
        this.habitat = habitat;
        this.diet = diet;
        this.conservationStatus = conservationStatus;
        this.createdAt = LocalDateTime.now();
    }

    public Long getBirdId() {
        return birdId;
    }

    public void setBirdId(Long birdId) {
        this.birdId = birdId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getHabitat() {
        return habitat;
    }

    public void setHabitat(String habitat) {
        this.habitat = habitat;
    }

    public String getDiet() {
        return diet;
    }

    public void setDiet(String diet) {
        this.diet = diet;
    }

    public String getConservationStatus() {
        return conservationStatus;
    }

    public void setConservationStatus(String conservationStatus) {
        this.conservationStatus = conservationStatus;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Bird{" +
                "birdId=" + birdId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", habitat='" + habitat + '\'' +
                ", diet='" + diet + '\'' +
                ", conservationStatus='" + conservationStatus + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}