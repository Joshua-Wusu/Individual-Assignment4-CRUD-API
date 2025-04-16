package crudApi.example.crudApi.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        // This block of code ensures that requests to /uploads/birds/** will always be served from the physical location
        Path uploadsDir = Paths.get("src/main/resources/static/uploads/birds").toAbsolutePath().normalize();
        String uploadPath = uploadsDir.toUri().toString();

        registry.addResourceHandler("/uploads/birds/**")
                .addResourceLocations(uploadPath);

        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");

        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/");

        registry.addResourceHandler("/pics/**")
                .addResourceLocations("classpath:/static/pics/");

        System.out.println("Resource handlers configured. Upload path: " + uploadPath);
    }
}