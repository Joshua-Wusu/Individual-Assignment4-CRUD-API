<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update ${animal.name} | The Bird Gallery</title>
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
                        <a class="nav-link" href="/animals/create">Add Bird</a>
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
                <li class="breadcrumb-item"><a href="/animals/${animal.birdId}">${animal.name}</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit</li>
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
                <h1 class="card-title h3"><i class="fas fa-edit"></i> Update Bird Information</h1>
            </div>
            <div class="card-body">
                <!-- Current Image Preview -->
                <div class="text-center mb-4">
                    <img src="${animal.imagePath}" alt="${animal.name}" class="img-fluid current-image-preview"
                         style="max-height: 200px;" onerror="this.src='/BirdFile/placeholder-bird.png'">
                    <p class="text-muted mt-2">Current Image</p>
                </div>

                <form action="/animals/${animal.birdId}" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="_method" value="PUT"/>

                    <!-- Name Field -->
                    <div class="mb-3">
                        <label for="animal.name" class="form-label">Bird Name</label>
                        <input type="text" class="form-control" id="animal.name" name="animal.name"
                               value="${animal.name!''}" placeholder="Enter bird name (e.g., Blue Jay)">
                        <div class="form-text">Scientific and common names are both acceptable.</div>
                    </div>

                    <!-- Image Upload Field -->
                    <div class="mb-3">
                        <label for="imageFile" class="form-label">Bird Image</label>
                        <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*">
                        <div class="form-text">Leave empty to keep the current image. Maximum file size: 5MB.</div>
                    </div>

                    <!-- Current Image Path (Hidden) -->
                    <input type="hidden" name="imagePath" value="${animal.imagePath}">

                    <!-- Description Field -->
                    <div class="mb-3">
                        <label for="animal.description" class="form-label">Description</label>
                        <textarea class="form-control" id="animal.description" name="animal.description" rows="5"
                                  placeholder="Describe the bird's appearance, behavior, etc.">${animal.description!''}</textarea>
                    </div>

                    <!-- Habitat Field -->
                    <div class="mb-3">
                        <label for="animal.habitat" class="form-label">Habitat</label>
                        <input type="text" class="form-control" id="animal.habitat" name="animal.habitat"
                               value="${animal.habitat!''}" placeholder="Enter habitat (e.g., Woodlands, Wetlands)">
                    </div>

                    <!-- Diet Field -->
                    <div class="mb-3">
                        <label for="animal.diet" class="form-label">Diet</label>
                        <input type="text" class="form-control" id="animal.diet" name="animal.diet"
                               value="${animal.diet!''}" placeholder="Enter diet (e.g., Seeds, Insects)">
                    </div>

                    <!-- Conservation Status Field -->
                    <div class="mb-3">
                        <label for="animal.conservationStatus" class="form-label">Conservation Status</label>
                        <select class="form-select" id="animal.conservationStatus" name="animal.conservationStatus">
                            <option value="" disabled>Select conservation status</option>
                            <option value="Extinct" <#if animal.conservationStatus == 'Extinct'>selected</#if>>Extinct</option>
                            <option value="Extinct in the Wild" <#if animal.conservationStatus == 'Extinct in the Wild'>selected</#if>>Extinct in the Wild</option>
                            <option value="Critically Endangered" <#if animal.conservationStatus == 'Critically Endangered'>selected</#if>>Critically Endangered</option>
                            <option value="Endangered" <#if animal.conservationStatus == 'Endangered'>selected</#if>>Endangered</option>
                            <option value="Vulnerable" <#if animal.conservationStatus == 'Vulnerable'>selected</#if>>Vulnerable</option>
                            <option value="Near Threatened" <#if animal.conservationStatus == 'Near Threatened'>selected</#if>>Near Threatened</option>
                            <option value="Least Concern" <#if animal.conservationStatus == 'Least Concern'>selected</#if>>Least Concern</option>
                            <option value="Data Deficient" <#if animal.conservationStatus == 'Data Deficient'>selected</#if>>Data Deficient</option>
                            <option value="Not Evaluated" <#if animal.conservationStatus == 'Not Evaluated'>selected</#if>>Not Evaluated</option>
                        </select>
                        <div class="form-text">Based on the IUCN Red List categories.</div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                        <a href="/animals/${animal.birdId}" class="btn btn-secondary me-md-2">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Update Bird
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
        // Image preview
        document.getElementById('imageFile').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                const imgPreview = document.querySelector('.current-image-preview');

                reader.onload = function(e) {
                    imgPreview.src = e.target.result;
                };

                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>