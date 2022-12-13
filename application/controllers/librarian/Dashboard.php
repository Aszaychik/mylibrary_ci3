<?php
class Dashboard extends CI_Controller
{
    public function index()
    {
        $data['borrows'] = $this->BooksModel->countBorrowingBook()->result();
        $this->load->view('librarian/templates/header');
        $this->load->view('librarian/templates/navbar');
        $this->load->view('librarian/dashboard/Statistic.php', $data);
        $this->load->view('librarian/templates/footer');
    }
    public function booksData()
    {
        $data['books'] = $this->BooksModel->viewBooks()->result();
        $data['genres'] = $this->BooksModel->viewGenres()->result();
        $this->load->view('librarian/templates/header');
        $this->load->view('librarian/templates/navbar');
        $this->load->view('librarian/dashboard/books/Books_data', $data);
        $this->load->view('librarian/templates/footer');
    }
    public function borrowingData()
    {
        $data['borrows'] = $this->BooksModel->fetchAllBorrowsData()->result();
        $this->load->view('librarian/templates/header');
        $this->load->view('librarian/templates/navbar');
        $this->load->view('librarian/dashboard/activity/Borrowing_data', $data);
        $this->load->view('librarian/templates/footer');
    }
    public function returningData()
    {
        $data['returns'] = $this->BooksModel->fetchAllReturningData()->result();
        $this->load->view('librarian/templates/header');
        $this->load->view('librarian/templates/navbar');
        $this->load->view('librarian/dashboard/activity/Returning_data', $data);
        $this->load->view('librarian/templates/footer');
    }
}
