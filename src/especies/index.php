<?php
require_once('./EspeciesController.php');

$controller = new EspeciesController();

$rows = $controller->listAll();

foreach($rows as $row) {
  echo $row['EspecieID'];

}

// https://www.php.net/manual/pt_BR/pdo.query.php