<?php
class Activity extends CI_Controller
{
    public function borrowBook($id_book)
    {
        $data['books'] = $this->BooksModel->getBookTitleById($id_book)->result();

        $this->load->view('librarian/templates/header');
        $this->load->view('librarian/templates/navbar');
        $this->load->view('librarian/dashboard/activity/Insert_borrow', $data);
        $this->load->view('librarian/templates/footer');
    }
    public function insertBorrowBook()
    {
        $this->form_validation->set_rules('id_book', 'Book name', 'required');
        $this->form_validation->set_rules('name', 'Borrower name', 'required');
        $this->form_validation->set_rules('address', 'Borrower address', 'required');
        $this->form_validation->set_rules('mobile_phone', 'Borrower mobile phone', 'required');
        $this->form_validation->set_rules('qty', 'Quantity', 'required');
        $qty = $this->input->post('qty');
        $id_book = $this->input->post('id_book');

        if ($this->form_validation->run() == false) {
            $data['books'] = $this->BooksModel->getBookTitleById($id_book)->result();

            $this->load->view('librarian/templates/header');
            $this->load->view('librarian/templates/navbar');
            $this->load->view('librarian/dashboard/activity/Insert_borrow', $data);
            $this->load->view('librarian/templates/footer');
        } else {
            $data = array(
                'id_book' => $id_book,
                'name' => $this->input->post('name'),
                'address' => $this->input->post('address'),
                'mobile_phone' => $this->input->post('mobile_phone'),
                'borrow_date' => round(microtime(true)),
                'returning_date' => round(microtime(true) + 604800),
                'qty' => $qty
            );
            $checkStock = $this->BooksModel->updateBookStock($id_book, $qty);
            if (!$checkStock) {
                echo ('Failed to borrow book because out of stock');
            }
            $this->BooksModel->insertBorrowBook($data);
            redirect('librarian/dashboard/borrowingData');
        }
    }
    public function returnBook()
    {
        $data = array(
            'id_book' => $this->input->post('id_book'),
            'id_borrowing' => $this->input->post('id_borrowing'),
            'late_fee' => round(intval($this->input->post('return_date')) /  round(microtime(true)) * 2000)
        );
        $this->BooksModel->returnBookById($data);
        redirect('librarian/Dashboard/returningData');
    }
}
