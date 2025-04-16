<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Bird | The Bird Gallery</title>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/animals">
                <img src="/pics/bird-logo.png" alt="Bird Gallery Logo" class="logo-img">
                <span class="brand-text">The Bird Gallery</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/animals">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/animals/create">Add Bird</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/animals/about">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container main-container">
        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="mt-3">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/animals">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Add New Bird</li>
            </ol>
        </nav>

        <!-- Error Messages Display -->
        <#if errorMessage??>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        </#if>

        <div class="card form-card">
            <div class="card-header bg-primary text-white">
                <h1 class="card-title h3"><i class="fas fa-feather-alt"></i> Add New Bird</h1>
            </div>
            <div class="card-body">
                <form action="/animals" method="post" enctype="multipart/form-data">
                    <!-- Name Field -->
                    <div class="mb-3">
                        <label for="animal.name" class="form-label">Bird Name</label>
                        <input type="text" class="form-control" id="animal.name" name="animal.name"
                               placeholder="Enter bird name (e.g., Blue Jay)">
                        <div class="form-text">Scientific and common names are both acceptable.</div>
                    </div>

                    <!-- Image Upload Field -->
                    <div class="mb-3">
                        <label for="imageFile" class="form-label">Bird Image</label>
                        <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*">
                        <div class="form-text">Maximum file size: 5MB. Supported formats: JPG, JPEG, PNG, WEBP.</div>
                    </div>

                    <!-- Image Preview -->
                    <div class="mb-3 text-center d-none" id="imagePreviewContainer">
                        <img id="imagePreview" class="img-fluid" style="max-height: 200px;" alt="Image preview">
                        <p class="text-muted mt-2">Preview</p>
                    </div>

                    <!-- Description Field -->
                    <div class="mb-3">
                        <label for="animal.description" class="form-label">Description</label>
                        <textarea class="form-control" id="animal.description" name="animal.description" rows="5"
                                  placeholder="Describe the bird's appearance, behavior, etc."></textarea>
                    </div>

                    <!-- Habitat Field -->
                    <div class="mb-3">
                        <label for="animal.habitat" class="form-label">Habitat</label>
                        <input type="text" class="form-control" id="animal.habitat" name="animal.habitat"
                               placeholder="Enter habitat (e.g., Woodlands, Wetlands)">
                    </div>

                    <!-- Diet Field -->
                    <div class="mb-3">
                        <label for="animal.diet" class="form-label">Diet</label>
                        <input type="text" class="form-control" id="animal.diet" name="animal.diet"
                               placeholder="Enter diet (e.g., Seeds, Insects)">
                    </div>

                    <!-- Conservation Status Field -->
                    <div class="mb-3">
                        <label for="animal.conservationStatus" class="form-label">Conservation Status</label>
                        <select class="form-select" id="animal.conservationStatus" name="animal.conservationStatus">
                            <option value="" selected disabled>Select conservation status</option>
                            <option value="Extinct">Extinct</option>
                            <option value="Extinct in the Wild">Extinct in the Wild</option>
                            <option value="Critically Endangered">Critically Endangered</option>
                            <option value="Endangered">Endangered</option>
                            <option value="Vulnerable">Vulnerable</option>
                            <option value="Near Threatened">Near Threatened</option>
                            <option value="Least Concern">Least Concern</option>
                            <option value="Data Deficient">Data Deficient</option>
                            <option value="Not Evaluated">Not Evaluated</option>
                        </select>
                        <div class="form-text">Based on the IUCN Red List categories.</div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                        <a href="/animals" class="btn btn-secondary me-md-2">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Add Bird
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-auto py-3">
        <div class="container text-center">
            <span class="text-muted">© 2025 The Bird Gallery. All rights reserved.</span>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        document.getElementById('imageFile').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                const previewContainer = document.getElementById('imagePreviewContainer');
                const imgPreview = document.getElementById('imagePreview');

                reader.onload = function(e) {
                    imgPreview.src = e.target.result;
                    previewContainer.classList.remove('d-none');
                };

                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>