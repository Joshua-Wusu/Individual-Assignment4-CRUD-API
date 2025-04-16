<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="About The Bird Gallery - Learn about our mission and purpose">
    <title>About | The Bird Gallery</title>
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
                        <a class="nav-link active" href="/animals/about">About</a>
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
                <li class="breadcrumb-item active" aria-current="page">About</li>
            </ol>
        </nav>

        <div class="card about-card">
            <div class="card-body">
                <h1 class="about-title text-center mb-4">About The Bird Gallery</h1>

                <div class="row mb-5">
                    <div class="col-lg-6">
                        <div class="about-image-container">
                            <img src="/pics/bird-logo.png" alt="Birds in their natural habitat" class="img-fluid rounded"
                                 onerror="this.src='/BirdFile/placeholder-bird.png'">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-section">
                            <h2><i class="fas fa-feather"></i> Our Mission</h2>
                            <p>The Bird Gallery is dedicated to showcasing the diversity of avian species around the world.
                               my goal is to promote bird conservation awareness and appreciation.</p>
                            <p>Through this digital platform, I aim to educate visitors about various bird species, their habitats,
                               diets, and conservation statuses, helping to inspire a deeper connection and appreciation for nature.</p>
                        </div>
                    </div>
                </div>

                <div class="row mb-5">
                    <div class="col-lg-6 order-lg-2">
                        <div class="about-image-container">
                            <img src="/pics/bird-logo.png" alt="Bird conservation efforts" class="img-fluid rounded"
                                 onerror="this.src='/BirdFile/placeholder-bird.png'">
                        </div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="about-section">
                            <h2><i class="fas fa-seedling"></i> Conservation Focus</h2>
                            <p>Birds face numerous threats today, including habitat loss, climate change, pollution, and invasive species.
                               By highlighting conservation statuses based on the IUCN Red List, I hope to raise awareness about
                               species at risk and the importance of conservation efforts.</p>
                            <p>I encourage visitors to support bird conservation organizations and engage in activities that
                               help protect bird habitats in their local communities.</p>
                        </div>
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-12">
                        <div class="about-section text-center">
                            <h2><i class="fas fa-users"></i> Community Participation</h2>
                            <p>The Bird Gallery is a collaborative platform where bird enthusiasts can contribute by adding
                               new bird entries, updating existing information, and sharing knowledge. I may include the means to add other animals in the future, stay tuned.</p>
                            <p>If you have photographs, observations, or information about bird species that you'd like to share,
                               I invite you to <a href="/animals/create">add them to my gallery</a>.</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="feature-card text-center">
                            <i class="fas fa-camera fa-3x mb-3 text-primary"></i>
                            <h3>Contribute Photos</h3>
                            <p>Share your bird photography with our community and help build our visual database.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card text-center">
                            <i class="fas fa-book fa-3x mb-3 text-primary"></i>
                            <h3>Educational Resource</h3>
                            <p>Use our gallery as a learning tool for bird identification and conservation awareness.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card text-center">
                            <i class="fas fa-globe fa-3x mb-3 text-primary"></i>
                            <h3>Global Perspective</h3>
                            <p>Explore bird species from diverse ecosystems and regions around the world.</p>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-5">
                    <a href="/animals" class="btn btn-primary btn-lg">
                        <i class="fas fa-feather-alt"></i> Explore Our Bird Gallery
                    </a>
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
</body>
</html>