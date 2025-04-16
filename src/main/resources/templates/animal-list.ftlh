<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Explore a diverse collection of bird species from around the world">
    <title>Bird Gallery - Explore the Feathered World</title>
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
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/animals">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/animals/create">Add Bird</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/animals/about">About</a>
                    </li>
                </ul>
                <!-- Search Form -->
                <form class="d-flex" action="/animals" method="get">
                    <input class="form-control me-2" type="search" placeholder="Search birds..."
                           name="search" value="${search!''}" aria-label="Search">
                    <button class="btn btn-outline-light" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container main-container">
        <!-- Alert Messages -->
        <#if message??>
        <div class="alert ${alertClass!'alert-info'} alert-dismissible fade show mt-3" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        </#if>

        <!-- Page Header -->
        <div class="page-header">
            <h1>Explore the Feathered World</h1>
            <p class="lead">Discover unique bird species from across the globe</p>
        </div>

        <!-- Bird Cards -->
        <div class="row">
            <#if animals?size == 0>
                <div class="col-12 text-center py-5">
                    <h3>No birds found</h3>
                    <p>Try a different search or <a href="/animals/create" class="btn btn-sm btn-primary">add a new bird</a></p>
                </div>
            <#else>
                <#list animals as animal>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card bird-card h-100">
                        <div class="card-img-container">
                            <img src="${animal.imagePath}" alt="${animal.name}" class="bird-card-img"
                                 onerror="this.onerror=null; this.src='/uploads/birds/placeholder-bird.png'; console.log('Using placeholder for: ' + this.alt);">
                            <!-- Optional loading animation -->
                            <div class="placeholder-overlay d-none">
                                <i class="fas fa-spinner fa-spin"></i>
                            </div>
                        </div>
                        <div class="card-body">
                            <h2 class="card-title">${animal.name}</h2>
                            <p class="card-text">${animal.description?truncate(150)}</p>
                            <div class="conservation-status">
                                <span class="badge bg-${statusColorMap[animal.conservationStatus?lower_case]!'info'}">
                                    ${animal.conservationStatus}
                                </span>
                            </div>
                        </div>
                        <div class="card-footer bg-transparent">
                            <a href="/animals/${animal.birdId}" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                </#list>
            </#if>
        </div>

        <!-- Pagination -->
        <#if totalPages?? && totalPages gt 1>
        <nav aria-label="Bird pagination" class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item ${(currentPage == 0)?then('disabled', '')}">
                    <a class="page-link" href="/animals?page=0" aria-label="First">
                        <span aria-hidden="true">««</span>
                    </a>
                </li>
                <li class="page-item ${(currentPage == 0)?then('disabled', '')}">
                    <a class="page-link" href="/animals?page=${currentPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </li>

                <#list (currentPage-2)..(currentPage+2) as i>
                    <#if i gte 0 && i lt totalPages>
                    <li class="page-item ${(currentPage == i)?then('active', '')}">
                        <a class="page-link" href="/animals?page=${i}">${i+1}</a>
                    </li>
                    </#if>
                </#list>

                <li class="page-item ${(currentPage == totalPages-1)?then('disabled', '')}">
                    <a class="page-link" href="/animals?page=${currentPage + 1}" aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </li>
                <li class="page-item ${(currentPage == totalPages-1)?then('disabled', '')}">
                    <a class="page-link" href="/animals?page=${totalPages - 1}" aria-label="Last">
                        <span aria-hidden="true">»»</span>
                    </a>
                </li>
            </ul>
        </nav>
        </#if>
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
        function getStatusColor(status) {
            status = status.toLowerCase();
            if (status.includes('extinct') || status.includes('endangered')) return 'danger';
            if (status.includes('vulnerable') || status.includes('near threatened')) return 'warning';
            if (status.includes('concern')) return 'success';
            return 'info';
        }

        document.addEventListener('DOMContentLoaded', function() {
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
                            this.src = '/uploads/birds/placeholder-bird.png';
                            this.onerror = null;
                        }
                    });
                });
            });
    </script>
</body>
</html>