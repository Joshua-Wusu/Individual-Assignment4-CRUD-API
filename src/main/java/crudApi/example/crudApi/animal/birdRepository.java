package crudApi.example.crudApi.animal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Provides the actual database transactions.
 */
@Repository
public interface birdRepository extends JpaRepository<Bird, Integer> {
    List<Bird> getBirdByDescription(String description);

    @Query(value = "select * from birds b where b.name like %?1% ", nativeQuery = true)
    List<Bird> getBirdByName(String name);
}
