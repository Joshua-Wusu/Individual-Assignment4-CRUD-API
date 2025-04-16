<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Learn about ${animal.name} - habitat, diet, and conservation status">
    <title>${animal.name} - Bird Details | The Bird Gallery</title>
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
                <li class="breadcrumb-item active" aria-current="page">${animal.name}</li>
            </ol>
        </nav>

        <!-- Bird Details -->
        <div class="card bird-detail-card">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="bird-image-container">
                        <!-- Updated fallback path -->
                        <img src="${animal.imagePath}" alt="${animal.name}"
                             onerror="console.error('Image failed to load: ' + this.src); this.src='/uploads/birds/placeholder-bird.png'; this.onerror=null;">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card-body">
                        <h1 class="card-title">${animal.name}</h1>

                        <div class="conservation-badge mb-3">
                            <span class="badge rounded-pill bird-badge" id="conservationBadge">
                                ${animal.conservationStatus}
                            </span>
                        </div>

                        <div class="bird-description mb-4">
                            <p class="card-text">${animal.description}</p>
                        </div>

                        <div class="bird-info">
                            <div class="info-item">
                                <h3><i class="fas fa-map-marker-alt"></i> Habitat</h3>
                                <p>${animal.habitat}</p>
                            </div>

                            <div class="info-item">
                                <h3><i class="fas fa-utensils"></i> Diet</h3>
                                <p>${animal.diet}</p>
                            </div>

                            <div class="info-item">
                                <h3><i class="fas fa-info-circle"></i> Added on</h3>
                                <p>
                                <#if animal.createdAt??>
                                    ${animal.createdAt?datetime("yyyy-MM-dd'T'HH:mm:ss.SSSSSS")?string("MMM d, yyyy, h:mm a")}
                                <#else>
                                    Unknown
                                </#if>
                                </p>
                            </div>
                        </div>

                        <div class="bird-actions mt-4">
                            <a href="/animals/${animal.birdId}/edit" class="btn btn-warning">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                            <a href="/animals" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Back to List
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Related Birds Section (Optional) -->
        <div class="related-birds mt-5">
            <h2>You Might Also Like</h2>
            <div class="row">
                <!-- This would be populated by a controller method that finds related birds -->
                <!-- Placeholder for demonstration -->
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-feather-alt fa-3x text-muted mb-3"></i>
                            <h3 class="card-title">Discover More Birds</h3>
                            <p class="card-text">Explore our complete collection of birds from around the world.</p>
                            <a href="/animals" class="btn btn-outline-primary">Browse Gallery</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-danger text-white">
            <h5 class="modal-title" id="deleteConfirmModalLabel"><i class="fas fa-exclamation-triangle"></i> Confirm Delete</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>Are you sure you want to delete <strong>${animal.name}</strong>?</p>
            <p class="text-danger"><i class="fas fa-exclamation-circle"></i> This action cannot be undone.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
              <i class="fas fa-times"></i> Cancel
            </button>
            <form id="deleteForm" action="/animals/${animal.birdId}/delete" method="post">
              <input type="hidden" name="_method" value="DELETE">
              <button type="submit" class="btn btn-danger">
                <i class="fas fa-trash"></i> Delete Bird
              </button>
            </form>
          </div>
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
        document.addEventListener('DOMContentLoaded', function() {
            const conservationBadge = document.getElementById('conservationBadge');
            const status = conservationBadge.textContent.trim().toLowerCase();

            if (status.includes('extinct') || status.includes('endangered')) {
                conservationBadge.classList.add('bg-danger');
            } else if (status.includes('vulnerable') || status.includes('near threatened')) {
                conservationBadge.classList.add('bg-warning');
            } else if (status.includes('concern')) {
                conservationBadge.classList.add('bg-success');
            } else {
                conservationBadge.classList.add('bg-info');
            }
        });

        document.addEventListener('DOMContentLoaded', function() {
                // Verify all images and fallback to the placeholder if necessary
                document.querySelectorAll('img[src^="/uploads/birds/"]').forEach(img => {
                    img.addEventListener('error', function() {
                        console.log('Failed to load image: ' + this.src);
                        this.src = '/uploads/birds/placeholder-bird.png';
                        this.onerror = null;
                    });
                });

                const conservationBadges = document.querySelectorAll('[id^="conservationBadge"]');
                conservationBadges.forEach(badge => {
                    const status = badge.textContent.trim().toLowerCase();
                    if (status.includes('extinct') || status.includes('endangered')) {
                        badge.classList.add('bg-danger');
                    } else if (status.includes('vulnerable') || status.includes('near threatened')) {
                        badge.classList.add('bg-warning');
                    } else if (status.includes('concern')) {
                        badge.classList.add('bg-success');
                    } else {
                        badge.classList.add('bg-info');
                    }
                });
            });
            document.addEventListener('DOMContentLoaded', function() {
                document.querySelectorAll('img[src^="/uploads/birds/"]').forEach(img => {
                    img.addEventListener('load', function() {
                        console.log('Successfully loaded image: ' + this.src);
                    });

                    img.addEventListener('error', function() {
                        console.error('Failed to load image: ' + this.src);
                        if (!this.src.startsWith('http')) {
                            const absoluteUrl = window.location.origin + this.src;
                            console.log('Trying absolute URL: ' + absoluteUrl);
                            this.src = absoluteUrl;
                            this.onerror = function() {
                                console.error('Absolute URL also failed. Using placeholder.');
                                this.src = '/uploads/birds/placeholder-bird.png';
                                this.onerror = null;
                            };
                        } else {
                            // If absolute URL fails, then use placeholder
                            this.src = '/uploads/birds/placeholder-bird.png';
                            this.onerror = null;
                        }
                    });
                });
            });
    </script>
</body>
</html>