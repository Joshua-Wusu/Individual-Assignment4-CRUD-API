package crudApi.example.crudApi.animal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "redirect:/animals";
    }

    @GetMapping("/home")
    public String homePage() {
        // Redirect /home to the animals page as well
        return "redirect:/animals";
    }
}