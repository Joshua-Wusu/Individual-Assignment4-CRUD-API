package crudApi.example.crudApi.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * birdService
 * The centralizes data access to the bird Database.
 */
@Service
public class birdService {
    @Autowired
    private birdRepository birdRepository;

    /**
     * Fetch all birds.
     *
     * @return the list of all birds.
     */
    public List<Bird> getAllBird() {
        return birdRepository.findAll();
    }

    /**
     * Fetch a bird.
     *
     * @param birdId the unique bird id.
     * @return a unique bird object.
     */
    public Bird getBirdById(int birdId) {
        return birdRepository.findById(birdId).orElse(null);
    }

    /**
     * Fetch all birds whose full description matches the search term.
     *
     * @param description the search key.
     * @return the list of matching birds.
     */
    public List<Bird> getBirdByDescription(String description) {
        return birdRepository.getBirdByDescription(description);
    }


    /**
     * Fetch all birds with a name that contains the given string.
     *
     * @param name the search name
     * @return list of matching birds
     */
    public List<Bird> getBirdByName(String name) {
        return birdRepository.getBirdByName(name);
    }

    /**
     * Add a new bird to the database.
     *
     * @param bird the new bird being added.
     */
    public void addNewBird(Bird bird) {
        birdRepository.save(bird);
    }

    /**
     * Update an existing birds data.
     *
     * @param birdId the unique bird ID.
     * @param bird the new birds details.
     */
    public void updateBird(int birdId, Bird bird) {
        Bird existing = getBirdById(birdId);
        existing.setName(bird.getName());
        existing.setDescription(bird.getDescription());
        birdRepository.save(existing);
    }

    /**
     * Delete a bird.
     *
     * @param birdId the unique bird ID.
     */
    public void deleteBirdById(int birdId) {
        birdRepository.deleteById(birdId);
    }
}
