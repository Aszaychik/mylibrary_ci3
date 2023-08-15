<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Borrowing Books</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Borrowing</li>
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
                            <h3 class="card-title">Data Borrowing from this library</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Borrower Name</th>
                                        <th>Book Title</th>
                                        <th>Borrow Date</th>
                                        <th>Returning Date</th>
                                        <th>Address</th>
                                        <th>Mobile Phone</th>
                                        <th>Quantity</th>
                                        <th colspan="3">Manage</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $no = 1;
                                    foreach ($borrows as $borrow) : ?>
                                        <tr>
                                            <td><?= $no++; ?></td>
                                            <td><?= $borrow->name; ?></td>
                                            <td><?= $borrow->title; ?></td>
                                            <td><?= date('d-M-Y', round($borrow->borrow_date / 1000)); ?></td>
                                            <td><?= date('d-M-Y', round($borrow->return_date / 1000)); ?></td>
                                            <td><?= $borrow->address; ?></td>
                                            <td><?= $borrow->mobile_phone; ?></td>
                                            <td><?= $borrow->qty; ?></td>
                                            <td>
                                                <form action="<?= base_url('librarian/Activity/returnBook') ?>" method="POST">
                                                    <input type="hidden" name="id_borrowing" value="<?= $borrow->id_borrowing; ?>">
                                                    <input type="hidden" name="id_book" value="<?= $borrow->id_book ?>">
                                                    <input type="hidden" name="return_date" value="<?= $borrow->return_date ?>">
                                                    <button type="submit" class="btn btn-primary btn-sm">Return</button>
                                                </form>
                                            </td>
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