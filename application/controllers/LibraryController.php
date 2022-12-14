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

	public function login()
  {
    if($this->input->post()){
      $username = $this->input->post('username');
      $password = $this->input->post('password');



      if($username == 'admin' && $password == 'admin'){
        $_SESSION['username'] = 'admin';

        redirect('/');
      }else{
        $this->session->set_flashdata('message', '<div class="alert alert-danger">Username or Password Invalid!</div>');

        redirect('LibraryController/login');
      }

    }
    $this->load->view('login');

    
  }

  public function logout()
  {
    $this->session->sess_destroy();
    redirect('/');
  }


}

?>
