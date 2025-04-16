package crudApi.example.crudApi.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BirdService {

    private final BirdRepository birdRepository;

    @Autowired
    public BirdService(BirdRepository birdRepository) {
        this.birdRepository = birdRepository;
    }

    public List<Bird> getAllBirds() {
        return birdRepository.findAll();
    }

    public Page<Bird> getAllBirdsPaginated(Pageable pageable) {
        return birdRepository.findAll(pageable);
    }

    public Bird getBirdById(Long id) {
        Optional<Bird> bird = birdRepository.findById(id);
        return bird.orElse(null);
    }

    public Bird createBird(Bird bird) {
        return birdRepository.save(bird);
    }

    public Bird updateBird(Bird bird) {
        if (birdRepository.existsById(bird.getBirdId())) {
            return birdRepository.save(bird);
        }
        return null;
    }

    public boolean deleteBird(Long id) {
        if (birdRepository.existsById(id)) {
            birdRepository.deleteById(id);
            return true;
        }
        return false;
    }

    public List<Bird> searchBirds(String keyword) {
        return birdRepository.searchBirds(keyword);
    }
}