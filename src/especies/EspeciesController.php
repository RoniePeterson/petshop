<?php
// session_start();
require_once('./EspeciesDAO.php');

class EspeciesController {

  private $dao;

  public function __construct()
  {
    $this->dao = new EspeciesDAO();
  }

  public function listAll() {
    return $this->dao->listAll();
  }

  public function getByID(int $id) {
    return $this->dao->getById($id);
  }
}