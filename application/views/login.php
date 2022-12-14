<?php $this->load->view('partials/header');  ?>

<header class="masthead" style="background-image: url('https://picsum.photos/1080/1920')">
        <div class="container position-relative px-4 px-lg-5">
          <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
              <div class="site-heading">
                <h1 class="">Login Page</h1>
              </div>
            </div>
          </div>
    </div>
    </header>   
    <!-- MAIN CONTENT -->
    <div class="container text-capitalize">
      <div class="row">
        <div class="col-md-8 mx-auto">
          <?= $this->session->flashdata('message');?>
          <?= form_open();?>
          <fieldset class="form-group">
            <label class="mb-2" for="username">username</label>
            <input class="form-control mb-3" type="text" name="username" id="username">
          </fieldset>
          <fieldset class="form-group">
            <label class="mb-2" for="password">password</label>
            <input class="form-control mb-3" type="password" name="password" id="password">
          </fieldset>
          <fieldset class="text-center">
            <button type="submit" class="btn btn-dark mb-4">Login</button>
          </fieldset>
        
        </div>
      </div>
    </div>
<?php $this->load->view('partials/footer');  ?>
