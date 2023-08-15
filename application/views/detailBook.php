<?php
$this->load->view('partials/header');
?>
<!-- Page Header-->
<?php
if (empty($book['thumb'])) {
    $cover = 'https://picsum.photos/1080/1920';
} else {
    $cover = base_url() . 'uploads/thumbs/' . $book['thumb'];
}
?>
<header class="masthead" style="background-image: url('<?= $cover; ?>')">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="post-heading">
                    <h1><?= $book['title']; ?></h1>
                    <span class="meta mb-2"> Author : <?= $book['author']; ?></span>
                    <span class="meta mb-2"> Publisher : <?= $book['publisher']; ?></span>
                    <span class="meta"> Posted on <?= date('d-m-Y', $book['date']); ?></span>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Post Content-->
<article class="mb-4">

    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">

                <p>Description</p>
                <p><?= $book['description']; ?></p>
            </div>
        </div>
    </div>
</article>
<?php
$this->load->view('partials/footer');
?>