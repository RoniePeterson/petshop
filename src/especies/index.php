<?php
require_once('../layouts/header.php');
require_once('./EspeciesController.php');

$controller = new EspeciesController();
$rows = $controller->listAll();
?>
<main class="container" >
  <h3>Espécies</h3>
  <div class="row pb-2">
    <div class="col-sm-12 text-right">
      <a href="/especies/new.php" class='btn btn btn-outline-info btn-sm'>Novo</a>
    </div>
  </div>
  <table class="table table-striped table-bordered table-sm">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Nome</th>
        <th scope="col">&nbsp;</th>
      </tr>
    </thead>
    <tbody>
      <?php
        if(!$rows['error'] && $rows['data']) {
          foreach($rows['data'] as $row) {
            echo "<tr>";
              echo "<td width='10%' scope='col'>" . $row['EspecieID'] . "</td>";
              echo "<td width='80%'>" . $row['EspecieNome'] . "</td>";
              echo "
              <td>
                <a href='/especies/show.php?id=" . $row['EspecieID'] . "' class='btn btn btn-outline-success btn-sm'>Exibir</a>
              </td>
              ";
            echo "</tr>";
          }
        } else {
        echo "<tr>
          <td colspan='3'>Não existem registros.</td>
        </tr>";
      } ?>
    </tbody>
  </table>
</main>
<?php
require_once('../layouts/footer.php');
?>