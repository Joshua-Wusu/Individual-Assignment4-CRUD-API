package crudApi.example.crudApi.animal;

import jakarta.persistence.*;

@Entity
@Table(name = "birds")
public class Bird {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private int birdId;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    public Bird(int birdId, String name, String description) {
        this.birdId = birdId;
        this.name = name;
        this.description = description;
    }

    public Bird(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public Bird() {
    }

    public int getBirdId() {
        return birdId;
    }

    public void setBirdId(int birdId) {
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
}


