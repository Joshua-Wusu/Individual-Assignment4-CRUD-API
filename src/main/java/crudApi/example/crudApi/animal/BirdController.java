package crudApi.example.crudApi.animal;

import crudApi.example.crudApi.config.FileStorageService;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/animals")
public class BirdController {

    private final BirdService birdService;
    private final FileStorageService fileStorageService;
    private static final int PAGE_SIZE = 9;

    @Autowired
    public BirdController(BirdService birdService, FileStorageService fileStorageService) {
        this.birdService = birdService;
        this.fileStorageService = fileStorageService;
    }

    @GetMapping
    public String listBirds(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "name") String sort,
            @RequestParam(required = false) String search,
            Model model) {

        PageRequest pageRequest = PageRequest.of(
                page, PAGE_SIZE, Sort.by(sort).ascending());

        if (search != null && !search.isEmpty()) {
            List<Bird> searchResults = birdService.searchBirds(search);
            model.addAttribute("animals", searchResults);
            model.addAttribute("search", search);
        } else {
            Page<Bird> birdsPage = birdService.getAllBirdsPaginated(pageRequest);
            model.addAttribute("animals", birdsPage.getContent());
            model.addAttribute("currentPage", birdsPage.getNumber());
            model.addAttribute("totalPages", birdsPage.getTotalPages());
            model.addAttribute("totalItems", birdsPage.getTotalElements());
        }

        return "animal-list";
    }

    @GetMapping("/{id}")
    public String viewBird(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        Bird bird = birdService.getBirdById(id);
        if (bird == null) {
            redirectAttributes.addFlashAttribute("message", "Bird with id: " + id + " not found");
            redirectAttributes.addFlashAttribute("alertClass", "alert-danger");
            return "redirect:/animals";
        }

        // check if image exists
        if (bird.getImagePath() != null && !bird.getImagePath().equals("/uploads/birds/placeholder-bird.png")) {
            if (!fileStorageService.fileExists(bird.getImagePath())) {
                System.out.println("Image not found: " + bird.getImagePath() + ". Using placeholder.");
                bird.setImagePath("/uploads/birds/placeholder-bird.png");
                birdService.updateBird(bird);
            }
        }

        model.addAttribute("animal", bird);
        return "animal-details";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("animal", new Bird());
        return "animal-create";
    }

    @PostMapping
    public String createBird(
            @RequestParam("animal.name") String name,
            @RequestParam("animal.description") String description,
            @RequestParam("animal.habitat") String habitat,
            @RequestParam("animal.diet") String diet,
            @RequestParam("animal.conservationStatus") String conservationStatus,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            RedirectAttributes redirectAttributes,
            Model model) {

        try {
            Bird bird = new Bird();
            bird.setName(name);
            bird.setDescription(description);
            bird.setHabitat(habitat);
            bird.setDiet(diet);
            bird.setConservationStatus(conservationStatus);

            // Process image file using the file storage service
            String imagePath = fileStorageService.storeFile(imageFile);
            bird.setImagePath(imagePath);
            System.out.println("Image path set to: " + imagePath);

            Bird savedBird = birdService.createBird(bird);
            System.out.println("Bird saved with ID: " + savedBird.getBirdId() + ", Image path: " + savedBird.getImagePath());

            redirectAttributes.addFlashAttribute("message", "Bird added successfully!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            return "redirect:/animals";

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Failed to create bird: " + e.getMessage());
            return "redirect:/animals/create";
        }
    }

    @GetMapping("/{id}/edit")
    public String showUpdateForm(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        Bird bird = birdService.getBirdById(id);
        if (bird == null) {
            redirectAttributes.addFlashAttribute("message", "Bird with id: " + id + " not found");
            redirectAttributes.addFlashAttribute("alertClass", "alert-danger");
            return "redirect:/animals";
        }
        model.addAttribute("animal", bird);
        return "animal-update";
    }

    @PostMapping("/{id}")
    public String updateBird(
            @PathVariable Long id,
            @RequestParam("animal.name") String name,
            @RequestParam("animal.description") String description,
            @RequestParam("animal.habitat") String habitat,
            @RequestParam("animal.diet") String diet,
            @RequestParam("animal.conservationStatus") String conservationStatus,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            @RequestParam(value = "_method", required = false) String method,
            RedirectAttributes redirectAttributes,
            Model model) {

        if ("PUT".equalsIgnoreCase(method)) {
            try {
                Bird bird = birdService.getBirdById(id);
                if (bird == null) {
                    redirectAttributes.addFlashAttribute("message", "Bird with id: " + id + " not found");
                    redirectAttributes.addFlashAttribute("alertClass", "alert-danger");
                    return "redirect:/animals";
                }

                bird.setName(name);
                bird.setDescription(description);
                bird.setHabitat(habitat);
                bird.setDiet(diet);
                bird.setConservationStatus(conservationStatus);

                if (imageFile != null && !imageFile.isEmpty()) {
                    String imagePath = fileStorageService.storeFile(imageFile);
                    bird.setImagePath(imagePath);
                    System.out.println("Updated image path: " + bird.getImagePath());
                }

                Bird updatedBird = birdService.updateBird(bird);

                redirectAttributes.addFlashAttribute("message", "Bird updated successfully!");
                redirectAttributes.addFlashAttribute("alertClass", "alert-success");
                return "redirect:/animals";
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("errorMessage", "Error updating bird: " + e.getMessage());
                return "animal-update";
            }
        }

        return "redirect:/animals";
    }

    @PostMapping("/{id}/delete")
    public String deleteBird(
            @PathVariable Long id,
            @RequestParam(value = "_method", required = false) String method,
            RedirectAttributes redirectAttributes) {

        boolean deleted = birdService.deleteBird(id);
        if (deleted) {
            redirectAttributes.addFlashAttribute("message", "Bird deleted successfully!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Bird with id: " + id + " not found");
            redirectAttributes.addFlashAttribute("alertClass", "alert-danger");
        }

        return "redirect:/animals";
    }

    @GetMapping("/about")
    public String showAboutPage() {
        return "about";
    }

    @ModelAttribute("statusColorMap")
    public Map<String, String> getStatusColorMap() {
        Map<String, String> colorMap = new HashMap<>();
        colorMap.put("extinct", "danger");
        colorMap.put("extinct in the wild", "danger");
        colorMap.put("critically endangered", "danger");
        colorMap.put("endangered", "danger");
        colorMap.put("vulnerable", "warning");
        colorMap.put("near threatened", "warning");
        colorMap.put("least concern", "success");
        colorMap.put("data deficient", "info");
        colorMap.put("not evaluated", "info");
        return colorMap;
    }

    @PostConstruct
    public void init() {
        try {
            Path placeholderPath = fileStorageService.getFileStorageLocation().resolve("placeholder-bird.png");

            if (!Files.exists(placeholderPath)) {
                createPlaceholderImage(placeholderPath);
                System.out.println("Created placeholder image at: " + placeholderPath.toAbsolutePath());
            }

            List<Bird> allBirds = birdService.getAllBirds();
            for (Bird bird : allBirds) {
                if (bird.getImagePath() == null) {
                    bird.setImagePath("/uploads/birds/placeholder-bird.png");
                    birdService.updateBird(bird);
                    System.out.println("Fixed null image path for bird ID: " + bird.getBirdId());
                    continue;
                }

                if (!bird.getImagePath().equals("/uploads/birds/placeholder-bird.png") &&
                        !fileStorageService.fileExists(bird.getImagePath())) {
                    System.out.println("Image not found for: " + bird.getName() + " (" + bird.getImagePath() + "). Using placeholder.");
                    bird.setImagePath("/uploads/birds/placeholder-bird.png");
                    birdService.updateBird(bird);
                }
            }

            System.out.println("Bird initialization completed successfully.");
        } catch (Exception e) {
            System.err.println("Error initializing bird data: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void createPlaceholderImage(Path path) throws IOException {
        BufferedImage img = new BufferedImage(300, 200, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = img.createGraphics();

        g2d.setColor(Color.LIGHT_GRAY);
        g2d.fillRect(0, 0, 300, 200);

        g2d.setColor(Color.BLACK);
        g2d.setFont(new Font("Arial", Font.BOLD, 20));
        g2d.drawString("Bird Image", 90, 80);
        g2d.drawString("Not Available", 70, 120);

        g2d.dispose();

        ImageIO.write(img, "png", path.toFile());
    }

    @GetMapping("/test-create")
    @ResponseBody
    public String testCreate() {
        try {
            Bird testBird = new Bird();
            testBird.setName("Test Bird");
            testBird.setDescription("This is a test bird description");
            testBird.setImagePath("/uploads/birds/placeholder-bird.png");
            testBird.setHabitat("Test habitat");
            testBird.setDiet("Test diet");
            testBird.setConservationStatus("Least Concern");

            Bird saved = birdService.createBird(testBird);
            return "Test bird created with ID: " + saved.getBirdId();
        } catch (Exception e) {
            e.printStackTrace();
            return "Error creating test bird: " + e.getMessage();
        }
    }
}