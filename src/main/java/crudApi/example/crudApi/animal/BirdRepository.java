package crudApi.example.crudApi.animal;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BirdRepository extends JpaRepository<Bird, Long> {

    List<Bird> findByNameContainingIgnoreCase(String name);

    List<Bird> findByConservationStatusIgnoreCase(String status);

    List<Bird> findByHabitatContainingIgnoreCase(String habitat);

    @Query("SELECT b FROM Bird b WHERE " +
            "LOWER(b.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(b.description) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(b.habitat) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(b.diet) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Bird> searchBirds(@Param("keyword") String keyword);

    @Override
    Page<Bird> findAll(Pageable pageable);
}