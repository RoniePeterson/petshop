<?php
// session_start();
require_once('./EspeciesService.php');

class EspeciesController {

  private $service;

  public function __construct()
  {
    $this->service = new EspeciesService();
  }

  public function listAll() {
    var_dump($this->service->listAll());

  }
}