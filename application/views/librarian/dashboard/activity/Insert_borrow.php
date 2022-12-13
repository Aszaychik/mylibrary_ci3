<div class="content-wrapper">
    <div class="container-fluid pt-2">
        <h4>New borrow</h4>
        <form action="<?= base_url('librarian/Activity/insertBorrowBook/') ?>" method="POST">
            <div class="form-group">
                <label for="">Borrower Name</label>
                <input type="text" name="name" class="form-control">
                <?php echo form_error('name', '<div class ="text-danger small ml-2 mt-2 mb-2">', '</div>') ?>
            </div>
            <div class="form-group">
                <?php foreach ($books as $book) { ?>
                    <label for="">Book Name</label>
                    <input type="hidden" name="id_book" class="form-control" value="<?= $book->id ?>">
                    <input type="text" class="form-control" value="<?= $book->title ?>" readonly>
                    <?php echo form_error('id_book', '<div class ="text-danger small ml-2 mt-2 mb-2">', '</div>') ?>
                <?php } ?>
            </div>
            <div class="form-group">
                <label for="">Quantity</label>
                <input name="qty" type="number" class="form-control" placeholder="Enter quantity">
                <?php echo form_error('qty', '<div class ="text-danger small ml-2 mt-2 mb-2">', '</div>') ?>
            </div>
            <div class="form-group">
                <label for="">Address</label>
                <input name="address" type="text" class="form-control" placeholder="Enter address">
                <?php echo form_error('address', '<div class ="text-danger small ml-2 mt-2 mb-2">', '</div>') ?>
            </div>
            <div class="form-group">
                <label for="">Mobile Phone</label>
                <input name="mobile_phone" type="number" class="form-control" placeholder="Enter mobile phone">
                <?php echo form_error('mobile_phone', '<div class ="text-danger small ml-2 mt-2 mb-2">', '</div>') ?>
            </div>

            <div class="modal-footer justify-content-between">
                <a href="<?= base_url('librarian/Dashboard/booksData'); ?>"><button type="button" class="btn btn-danger">Back</button></a>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </form>
    </div>
</div>