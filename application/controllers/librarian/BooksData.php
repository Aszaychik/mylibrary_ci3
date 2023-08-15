<?php
class BooksData extends CI_Controller
{
    public function insertBook()
    {
        $this->form_validation->set_rules('title', 'Book title', 'required');

        if ($this->form_validation->run() == false) {
            $data['books'] = $this->BooksModel->viewBooks()->result();
            $data['genres'] = $this->BooksModel->viewGenres()->result();
            $this->load->view('librarian/templates/header');
            $this->load->view('librarian/templates/navbar');
            $this->load->view('librarian/dashboard/books/Books_data', $data);
            $this->load->view('librarian/templates/footer');
        } else {
            $thumb = $_FILES['thumb']['name'];
            if ($thumb = '') {
            } else {
                $config['upload_path'] = './uploads/thumbs';
                $config['allowed_types'] = 'jpg|jpeg|png';

                $this->load->library('upload', $config);

                if (!$this->upload->do_upload('thumb')) {
                    echo 'Failed to Upload Thumbnail';
                } else {
                    $thumb = $this->upload->data('file_name');
                }
            }
            $data = array(
                'author' => $this->input->post('author'),
                'publisher' => $this->input->post('publisher'),
                'id_genre' => $this->input->post('id_genre'),
                'title' => $this->input->post('title'),
                'stock' => $this->input->post('stock'),
                'publish_year' => $this->input->post('publish_year'),
                'thumb' => $thumb,
                'date' => round(microtime(true))
            );

            $this->BooksModel->insertBook($data);
            redirect('librarian/Dashboard/booksData');
        }
    }
    public function updateBook($id)
    {
        $data['books'] = $this->BooksModel->getBookDataById($id)->result();
        $data['genres'] = $this->BooksModel->viewGenres()->result();

        $this->load->view('librarian/templates/header');
        $this->load->view('librarian/templates/navbar');
        $this->load->view('librarian/dashboard/books/Update_book', $data);
        $this->load->view('librarian/templates/footer');
    }

    public function proccessUpdateBook($id)
    {
        $this->form_validation->set_rules('title', 'Book title', 'required');
        if ($this->form_validation->run() == false) {
            $data['books'] = $this->BooksModel->viewBooks()->result();
            $data['genres'] = $this->BooksModel->viewGenres()->result();
            $this->load->view('librarian/templates/header');
            $this->load->view('librarian/templates/navbar');
            $this->load->view('librarian/dashboard/books/Books_data', $data);
            $this->load->view('librarian/templates/footer');
        } else {
            $thumb = $_FILES['thumb']['name'];
            var_dump($thumb);
            if ($thumb = '') {
            } else {

                $config['upload_path'] = './uploads/thumbs';
                $config['allowed_types'] = 'jpg|jpeg|png';
                $this->load->library('upload', $config);

                if (!$this->upload->do_upload('thumb')) {
                    echo 'Failed to Upload Thumbnail';
                } else {
                    $thumb = $this->upload->data('file_name');
                }
            }
            $data = array(
                'id' => $id,
                'author' => $this->input->post('author'),
                'publisher' => $this->input->post('publisher'),
                'id_genre' => $this->input->post('id_genre'),
                'title' => $this->input->post('title'),
                'stock' => $this->input->post('stock'),
                'publish_year' => $this->input->post('publish_year'),
                'thumb' => $thumb,
                'description' => $this->input->post('description')
            );
            $this->BooksModel->updateBookById($id, $data);
            redirect('librarian/Dashboard/booksData');
        }
    }
    public function deleteBook($id)
    {
        $this->BooksModel->deleteBook($id);
        redirect('librarian/Dashboard/booksData');
    }
}
