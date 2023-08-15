<?php
class BooksModel extends CI_Model
{
	public function getBooks()
	{
		$this->db->order_by("date", "desc");
		return $this->db->get("tb_books");
	}
	public function getDetail($field, $value)
	{
		$this->db->where($field, $value);
		return $this->db->get("tb_books");
	}
    public function viewBooks()
    {
        $this->db->select('b.id as id')
            ->select('b.title as title')
            ->select('b.author as author')
            ->select('b.publisher as publisher')
            ->select('b.stock as stock')
            ->select('b.publish_year as year')
            ->select('b.date as date')
            ->select('g.name as genre')
            ->from('tb_books as b')
            ->join('tb_genres as g', 'b.id_genre = g.id', 'left');
        return $this->db->get();
    }
    public function viewGenres()
    {
        return $this->db->get('tb_genres');
    }
    public function insertBook($data)
    {
        return $this->db->insert('tb_books', $data);
    }
    public function getBookDataById($id)
    {
        return $this->db->where('id', $id)->get('tb_books');
    }
    public function getBookTitleById($id)
    {
        return $this->db->select('id')
            ->select('title')
            ->where('id', $id)->get('tb_books');
    }
    public function updateBookById($id, $data)
    {
        return $this->db->where('id', $id)->update('tb_books', $data);
    }
    public function deleteBook($id)
    {
        return $this->db->where('id', $id)->delete('tb_books');
    }
    public function fetchAllBorrowsData()
    {
        $this->db->select('brw.id as id_borrowing')
            ->select('b.id as id_book')
            ->select('b.title as title')
            ->select('brw.name as name')
            ->select('brw.borrow_date as borrow_date')
            ->select('brw.returning_date as return_date')
            ->select('brw.qty as qty')
            ->select('brw.address as address')
            ->select('brw.mobile_phone mobile_phone')
            ->from('tb_borrowing as brw')
            ->join('tb_books as b', 'b.id=brw.id_book')
            ->where('brw.status', 'borrowing');
        return $this->db->get();
    }
    public function insertBorrowBook($data)
    {
        $this->db->insert('tb_borrowing', $data);
    }
    public function updateBookStock($id, $qty)
    {
        if ($this->db->select('stock')->from('tb_books') != 0) {
            $this->db->query("update tb_books set stock  = stock - {$qty} where id = '{$id}'");
        }
        return false;
    }
    public function fetchAllReturningData()
    {
        $this->db->select('b.title as title')
            ->select('brw.name as borrower_name')
            ->select('brw.returning_date as returning_date')
            ->select('r.late_fee as late_fee')
            ->from('tb_returning as r')
            ->join('tb_books as b', 'b.id = r.id_book')
            ->join('tb_borrowing as brw', 'brw.id = r.id_borrowing');
        return $this->db->get();
    }
    public function returnBookById($data)
    {
        $this->db->set('status', 'returned')->where('id', $data['id_borrowing'])->update('tb_borrowing');
        $this->db->insert('tb_returning', $data);
    }
    public function countBorrowingBook()
    {
        return $this->db->query("select count(status) as count from tb_borrowing where status = 'borrowing'");
    }
}
