The Bird Gallery 🦅
A Spring Boot application for bird enthusiasts to explore, catalog, and share information about various bird species. This web app allows users to browse bird details, add new entries, and manage a comprehensive bird database with images and conservation information.
Features

Bird Catalog: Browse a collection of bird species with images, descriptions, habitats, and more
Detail View: View comprehensive information about each bird species
Add New Birds: Contribute to the gallery by adding new bird species
Image Management: Upload and display bird images with fallback handling
Conservation Status: Track the conservation status of each species with color-coded indicators
Search Functionality: Find birds quickly using the search feature
Responsive Design: Enjoy a seamless experience across devices of all sizes

Technology Stack

Backend: Spring Boot 3.x with Java 17
Database: MySQL
Frontend: FreeMarker templates (FTLH), Bootstrap 5, CSS, JavaScript
Image Handling: Custom file storage with fallback mechanism
Pagination: Built-in pagination for large collections

Installation Guide
Prerequisites

Java 17 or higher
MySQL 8.0 or higher
Maven 3.6 or higher

Database Setup

Create a MySQL database:
sqlCREATE DATABASE bird-database;

Configure database connection in application.properties:
propertiesspring.datasource.url=jdbc:mysql://localhost:3306/bird-database?useSSL=false
spring.datasource.username=root
spring.datasource.password=your_password


Running the Application

Clone the repository:
bashgit clone https://github.com/yourusername/bird-gallery.git
cd bird-gallery

Build the project:
bashmvn clean install

Run the application:
bashmvn spring-boot:run

Access the application:
http://localhost:8080/animals


Project Structure
src/
├── main/
│   ├── java/
│   │   └── crudApi/
│   │       └── example/
│   │           └── crudApi/
│   │               ├── animal/
│   │               │   ├── Bird.java
│   │               │   ├── BirdController.java
│   │               │   ├── BirdRepository.java
│   │               │   └── BirdService.java
│   │               └── config/
│   │                   ├── FileStorageService.java
│   │                   ├── WebConfig.java
│   │                   ├── HomeController.java
│   │                   └── CustomErrorController.java
│   ├── resources/
│   │   ├── static/
│   │   │   ├── css/
│   │   │   │   └── styles.css
│   │   │   ├── pics/
│   │   │   │   └── bird-logo.png
│   │   │   └── uploads/
│   │   │       └── birds/
│   │   └── templates/
│   │       ├── animal-create.ftlh
│   │       ├── animal-details.ftlh
│   │       ├── animal-list.ftlh
│   │       ├── animal-update.ftlh
│   │       ├── about.ftlh
│   │       └── error/
│   │           ├── 404.ftlh
│   │           ├── 500.ftlh
│   │           └── general.ftlh
└── test/
Image Upload Functionality
The application includes a custom image handling system that:

Stores uploaded images in the /uploads/birds/ directory
Generates unique filenames to avoid conflicts
Provides automatic fallback to placeholder images
Optimizes image display for both list and detail views

Troubleshooting
Common Issues

Images not displaying correctly:

Ensure the upload directory exists and has proper permissions
Check browser console for image loading errors
Verify image paths in the database match the actual file paths


Database connection issues:

Confirm MySQL is running
Verify database credentials in application.properties


Application fails to start:

Check logs for detailed error messages
Ensure all required dependencies are available



Future Enhancements

User authentication and authorization
Bird categorization by family and region
Interactive map showing bird habitats
Community features (comments, favorites)
Migration pattern visualization
Bird call audio samples

The database file export containing the website look populated with sample birds will be provided :)
