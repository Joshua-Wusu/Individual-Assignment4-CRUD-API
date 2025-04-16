package crudApi.example.crudApi.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Service
public class FileStorageService {

    private final Path fileStorageLocation;

    public FileStorageService(@Value("${file.upload-dir:src/main/resources/static/uploads/birds/}") String uploadDir) {
        this.fileStorageLocation = Paths.get(uploadDir).toAbsolutePath().normalize();

        // Create directory if it doesn't exist
        try {
            Files.createDirectories(this.fileStorageLocation);
            System.out.println("File storage location: " + this.fileStorageLocation);
        } catch (IOException ex) {
            throw new RuntimeException("Could not create the directory where the uploaded files will be stored.", ex);
        }
    }

    public String storeFile(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return "/uploads/birds/placeholder-bird.png";
        }

        try {
            String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());

            originalFilename = originalFilename.replaceAll("\\s+", "_");

            // Generate unique filename
            String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;

            if (originalFilename.contains("..")) {
                throw new RuntimeException("Filename contains invalid path sequence: " + originalFilename);
            }

            // Copy the file to the target location
            Path targetLocation = this.fileStorageLocation.resolve(uniqueFilename);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            // Return the path
            return "/uploads/birds/" + uniqueFilename;
        } catch (IOException ex) {
            System.err.println("Failed to store file: " + ex.getMessage());
            ex.printStackTrace();
            return "/uploads/birds/placeholder-bird.png";
        }
    }

    public boolean fileExists(String relativePath) {
        String normalizedPath = StringUtils.cleanPath(relativePath);

        if (normalizedPath.startsWith("/")) {
            normalizedPath = normalizedPath.substring(1);
        }

        String[] parts = normalizedPath.split("/");
        String filename = parts[parts.length - 1];

        // Check if the file exists
        Path filePath = this.fileStorageLocation.resolve(filename);
        return Files.exists(filePath);
    }

    public Path getFileStorageLocation() {
        return fileStorageLocation;
    }
}