package crudApi.example.crudApi.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 * birdController
 * Includes all REST API endpoint mappings for bird object.
 */
@RestController
@RequestMapping("/birds")
public class birdController {

    @Autowired
    private birdService service;

    /**
     * Get a list of all the birds in the database.
     * http://localhost:8080/birds/all
     *
     * @return a list of birds.
     */
    @GetMapping("/all")
    public Object getAllBird() {
        return new ResponseEntity<>(service.getAllBird(), HttpStatus.OK);
    }

    /**
     * Get a specific bird using its ID.
     * http://localhost:8080/birds/8888
     *
     * @param birdId the unique ID for a bird.
     * @return a bird object.
     */
    @GetMapping("/{birdId}")
    public Object getOneBird(@PathVariable int birdId) {
        return new ResponseEntity<>(service.getBirdById(birdId), HttpStatus.OK);
    }

    /**
     * Get a list of the birds with a name that contains a given string.
     * http://localhost:8080/birds/name?search=eagle
     *
     * @param search the search key
     * @return list of all birds matching the search key.
     */
    @GetMapping("/name")
    public Object getBirdByName(@RequestParam(name = "search", defaultValue = "") String search) {
        return new ResponseEntity<>(service.getBirdByName(search), HttpStatus.OK);
    }

    /**
     * Get a list of birds based on their full description. This replaces getting an animal by breed requirement.
     * http://localhost:8080/birds/description/
     *
     * @param description the search key.
     * @return A list of Student objects matching the search key.
     */
    @GetMapping("/description/{description}")
    public Object getBirdByDescription(@PathVariable String description) {
        return new ResponseEntity<>(service.getBirdByDescription(description), HttpStatus.OK);
    }

    /**
     * Create a new bird entry.
     * http://localhost:8080/birds/new  { "name": "Blue jay", "description": "Blue jays are natural forest dwellers, but they are also highly adaptable and intelligent birds." }
     *
     * @param bird the new bird object.
     * @return the updated list of birds.
     */
    @PostMapping("/new")
    public Object addNewBird(@RequestBody Bird bird) {
        service.addNewBird(bird);
        return new ResponseEntity<>(service.getAllBird(), HttpStatus.CREATED);
    }

    /**
     * Update an existing birds data.
     * http://localhost:8080/birds/update/8890 { "birdId": 8890, "name": "Test Bird", "description": "Tester, now with changes." }
     *
     * @param birdId the birds ID.
     * @param bird the new updated bird details.
     * @return the updated bird object.
     */
    @PutMapping("/update/{birdId}")
    public Object updateBird(@PathVariable int birdId, @RequestBody Bird bird) {
        service.updateBird(birdId, bird);
        return new ResponseEntity<>(service.getBirdById(birdId), HttpStatus.CREATED);
    }

    /**
     * Delete a bird.
     * http://localhost:8080/birds/delete/8890 { "birdId": 8890, "name": "Test Bird", "description": "Tester, now with changes." }
     *
     * @param birdId the unique birds ID.
     * @return the updated list of birds.
     */
    @DeleteMapping("/delete/{birdId}")
    public Object deleteBirdById(@PathVariable int birdId) {
        service.deleteBirdById(birdId);
        return new ResponseEntity<>(service.getAllBird(), HttpStatus.OK);
    }
}
