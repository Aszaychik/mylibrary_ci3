<?php
$this->load->view('partials/header');
?>
<!-- Page Header-->
<header class="masthead" style="background-image: url('https://picsum.photos/1080/1920')">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1>Welcome to My Library</h1>
                    <span class="subheading">A Library using CI3 by <a class="fw-bold" href="#">Kelompok 7</a></span>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Main Content-->
<div class="container px-4 px-lg-5">
    <div class="row gx-4 gx-lg-5 justify-content-center">
        <div class="col-md-10 col-lg-8 col-xl-7">
            <?= $this->session->flashdata('message'); ?>
            <form action="" method="get" class="text-center mb-5">
                <div class="input-group">
                    <input type="search" class="form-control" name="search" placeholder="Search ...">
                    <input type="submit" class="btn btn-dark" value="Search">
                </div>
            </form>
            <!-- Post preview-->
            <h1 class="text-center">
                Newest Book
            </h1>
            <hr class="my-4">
            <?php foreach ($books as $key => $book) { ?>
                <div class="post-preview">

                    <div class="my-5">
                        <a href="<?= site_url("LibraryController/getDetailBook/" . $book['id']); ?>" class="text-capitalize">
                            <h3><?= $book['title']; ?></h3>
                        </a>
                        <p class="post-meta">Posted on <?= date('d-M-Y', $book['date']); ?>
                        </p>
                        <figure class="d-flex justify-content-center align-items-center flex-column gap-5 my-3">
                            <img class="img-fluid img-thumbnail w-50" src="<?= base_url("uploads/thumbs/" . $book['thumb']); ?>" alt="<?= base_url("uploads/thumbs/" . $book['thumb']); ?>">
                        </figure>

                </div>
            <?php } ?>
        </div>
    </div>
</div>
<?php
$this->load->view('partials/footer');
?>