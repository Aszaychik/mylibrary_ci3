     <div class="content-wrapper">
         <div class="container-fluid">
             <h4 class="mt-2 mb-2">Update Book</h4>
             <?php foreach ($books as $book) : ?>
                 <form action="<?= base_url('librarian/BooksData/proccessUpdateBook/' . $book->id) ?>" method="POST" enctype="multipart/form-data">
                     <div class="form-group">
                         <label class="text-secondary" for="">Book title</label>
                         <input name="title" type="text" class="form-control" value="<?= $book->title; ?>" placeholder="Enter title">
                         <?php echo form_error('title', '<div class ="text-danger small ml-2 mt-2 mb-2">', '</div>') ?>
                     </div>
                     <div class="form-group">
                         <label for="">Author</label>
                         <input name="author" type="text" class="form-control" value="<?= $book->author; ?>" placeholder=" Enter author">
                     </div>
                     <div class="form-group">
                         <label for="">Genre</label>
                         <select name="id_genre" class="form-control" id="">
                             <?php foreach ($genres as $genre) : ?>
                                 <option value="<?= $genre->id; ?>"><?= $genre->name; ?></option>
                             <?php endforeach; ?>
                         </select>
                     </div>
                     <div class="form-group">
                         <label for="">Publisher</label>
                         <input name="publisher" type="text" class="form-control" value="<?= $book->publisher; ?>" placeholder=" Enter publisher">
                     </div>
                     <div class="form-group">
                         <label for="">Stock</label>
                         <input name="stock" type="number" class="form-control" value="<?= $book->stock; ?>" placeholder=" Enter stock">
                     </div>
                     <div class="form-group">
                         <label for="">Publish Year</label>
                         <input name="publish_year" type="number" class="form-control" value="<?= $book->publish_year ?>" placeholder="Enter title">
                     </div>
                     <div class="form-group">
                         <label for="exampleInputFile">Thumbnail</label>
                         <div class="input-group">
                             <div class="custom-file">
                                 <input type="file" name="thumb" class="custom-file-input" value="<?= $book->thumb; ?>">
                                 <label class="custom-file-label">Choose file</label>
                             </div>
                             <div class="input-group-append">
                                 <span class="input-group-text">Upload</span>
                             </div>
                         </div>
                     </div>

                     <div class="modal-footer justify-content-between">
                         <a href="<?= base_url('librarian/Dashboard/booksData'); ?>"><button type="button" class="btn btn-danger">Back</button></a>
                         <button type="submit" class="btn btn-primary">Save changes</button>
                     </div>
                 <?php endforeach; ?>
                 </form>
         </div>
     </div>