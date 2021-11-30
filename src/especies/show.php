<?php
require_once('../layouts/header.php');
require_once('./EspeciesController.php');

$controller = new EspeciesController();
if(isset($_GET['id'])) {
  $id = (int)$_GET['id'];
  $rows = $controller->getByID($id);
  if($rows['error'] || !$rows['data']) {
    echo 'não achei';
    die();
  }
  $row = $rows['data'][0];

}
?>
<main class="container" >
  <h3>Espécies</h3>

  <div class="mb-3">
    <label for="EspecieID" class="form-label">ID</label>
    <input
      type="text"
      class="form-control"
      disabled
      name="EspecieID"
      value="<?php echo $id;?>"
    >
  </div>

  <div class="mb-3">
    <label for="EspecieNome" class="form-label">Nome</label>
    <input
      type="text"
      class="form-control"
      disabled
      name="EspecieNome"
      value="<?php echo $row['EspecieNome'];?>"
    >
  </div>

  <div class="mb-3">
    <button type="submit" class="btn btn btn-outline-warning">Alterar</button>
  </div>
</main>
<?php
require_once('../layouts/footer.php');
?>