<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error | The Bird Gallery</title>
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
        <div class="error-container text-center py-5">
            <div class="error-icon">
                <i class="fas fa-exclamation-triangle fa-5x text-danger mb-4"></i>
            </div>

            <h1 class="error-title">Oops! Something went wrong</h1>

            <div class="error-message my-4">
                <p class="lead">${errorMessage!"An unexpected error occurred."}</p>
            </div>

            <div class="error-actions mt-5">
                <a href="/animals" class="btn btn-primary btn-lg me-2">
                    <i class="fas fa-home"></i> Return to Home
                </a>
                <button onclick="window.history.back()" class="btn btn-secondary btn-lg">
                    <i class="fas fa-arrow-left"></i> Go Back
                </button>
            </div>

            <div class="error-help mt-5">
                <p class="text-muted">If this problem persists, please contact the administrator.</p>
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
</body>
</html>