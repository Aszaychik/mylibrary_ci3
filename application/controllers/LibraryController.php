<?php

class LibraryController extends CI_Controller{
	public function index()
	{
		$data['books'] = $this->BooksModel->getBooks()->result_array();
		$this->load->view('library', $data);
	}

	public function getDetailBook(String $id)
	{
		$query = $this->BooksModel->getDetail('id',$id);
    $data['book'] = $query->row_array();

    $this->load->view('detailBook', $data);
	}


}

?>
