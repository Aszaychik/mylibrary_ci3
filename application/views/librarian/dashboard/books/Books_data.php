<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Data Books</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Books</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data from books in this library</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#modal-default">
                                Input Book
                            </button>
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Title</th>
                                        <th>Author</th>
                                        <th>Genre</th>
                                        <th>Year</th>
                                        <th>Publisher</th>
                                        <th>Stock</th>
                                        <th>Date</th>
                                        <th colspan="3">Manage</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $no = 1;
                                    foreach ($books as $book) : ?>
                                        <tr>
                                            <td><?= $no++; ?></td>
                                            <td><?= $book->title; ?></td>
                                            <td><?= $book->author; ?></td>
                                            <td><?= $book->genre; ?></td>
                                            <td><?= $book->year; ?></td>
                                            <td><?= $book->publisher; ?></td>
                                            <td><?= $book->stock; ?></td>
                                            <td><?= date('d-m-y', $book->date); ?></td>
                                            <td><a href="<?= base_url('librarian/activity/borrowBook/' . $book->id) ?>"><button class="btn btn-primary btn-sm">Borrow</button></a></td>
                                            <td><a href="<?= base_url('librarian/BooksData/updateBook/' . $book->id) ?>"><button class="btn btn-warning btn-sm">Update</button></a></td>
                                            <td><a href="<?= base_url('librarian/BooksData/deleteBook/' . $book->id) ?>"><button class="btn btn-danger btn-sm">Delete</button></a></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Publish New Book</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<?= base_url('librarian/BooksData/insertBook') ?>" method="POST" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="">Book title</label>
                            <input name="title" type="text" class="form-control" placeholder="Enter title">
                            <?php echo form_error('title', '<div class ="text-danger small ml-2 mt-2 mb-2">', '</div>') ?>
                        </div>
                        <div class="form-group">
                            <label for="">Author</label>
                            <input name="author" type="text" class="form-control" placeholder="Enter author">
                        </div>
                        <div class="form-group">
                            <label for="">Genre</label>
                            <select name="id_genre" class="form-control" id="">
                                <option value=""></option>
                                <?php foreach ($genres as $genre) : ?>
                                    <option value="<?= $genre->id; ?>"><?= $genre->name; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Publisher</label>
                            <input name="publisher" type="text" class="form-control" placeholder="Enter publisher">
                        </div>
                        <div class="form-group">
                            <label for="">Publish Year</label>
                            <input name="publish_year" type="number" class="form-control" placeholder="Enter title">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile">Thumbnail</label>
                            <div class="input-group">
                                <div class="custom-file">
                                    <input type="file" name="thumb" class="custom-file-input">
                                    <label class="custom-file-label">Choose file</label>
                                </div>
                                <div class="input-group-append">
                                    <span class="input-group-text">Upload</span>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->