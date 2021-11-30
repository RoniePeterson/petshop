<?php
require_once('../database/conexao.php');

class EspeciesDAO
{

    public function listAll()
    {
        try {
            $dbh = DB::getInstance();

            $query = "
              SELECT * FROM `petshop_db`.`especies`
              ORDER BY EspecieNome
            ";

            $result = $dbh->query($query, PDO::FETCH_ASSOC);

            return [
              "error" => FALSE,
              "data" => $result->fetchAll()
            ];

        } catch (PDOException $e) {
            return [
              "error" => TRUE,
              "data: " . $e->getMessage()
            ];
        }
    }

    public function getByID(int $id)
    {
        try {
          $dbh = DB::getInstance();

          $data = array(
            ":EspecieID"=> $id
          );

          $query = "
            SELECT * FROM `petshop_db`.`especies`
            WHERE EspecieID = :EspecieID
          ";

          $statement = $dbh->prepare($query);
          $statement->execute($data);

          return [
            "error" => FALSE,
            "data" => $statement->fetchAll()
          ];
        } catch (PDOException $e) {
          return [
            "error" => TRUE,
            "data: " . $e->getMessage()
          ];
        }
    }

    public function findByUuid($uuid)
    {
        try {
            $dbh = DB::getInstance();

            $sql = "Select * from tabela where uuid = :uuid";
            $stmt = $dbh->prepare($sql);
            $stmt->bindValue(":uuid", $uuid);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return  $result;
        } catch (PDOException $e) {
            return "Error!: " . $e->getMessage() . "<br/>";
        }
    }

    public function store($data)
    {
        try {

            $dbh = DB::getInstance();

            $sql = "INSERT INTO tabela
                        (nome_completo, numero_cpf)
                VALUES (:nome_completo, :numero_cpf)";

            $stmt = $dbh->prepare($sql);

            $stmt->bindParam(':nome_completo', $data['nome_completo']);
            $stmt->bindParam(':numero_cpf', $data['numero_cpf']);


            $retorno = $stmt->execute();

            return $retorno;
        } catch (PDOException $e) {
            throw "Error!: " . $e->getMessage();
        }
    }

    public function updateEnviouEmailTrue($uuid)
    {
        try {

            $dbh = DB::getInstance();

            $sql = "UPDATE tabela SET enviou_email = 1 where uuid = :uuid";

            $stmt = $dbh->prepare($sql);

            $stmt->bindParam(':uuid', $uuid);
            $stmt->execute();
        } catch (PDOException $e) {
            throw "Error!: " . $e->getMessage() . "<br/>";
        }
    }
}
