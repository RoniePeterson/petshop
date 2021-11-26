<?php
require_once('../database/conexao.php');

class EspeciesDAO
{

    public function listAll()
    {
        try {
            $dbh = DB::getInstance();

            $sql = "Select * from `petshop_db`.`especies`";

            $sth = $dbh->query($sql, PDO::FETCH_ASSOC);

            return $sth->fetchAll();

        } catch (PDOException $e) {
            return "Error!: " . $e->getMessage() . "<br/>";
        }
    }

    public function listOne($dado)
    {
        try {
            $dbh = DB::getInstance();

            $sql = "Select * from tabela where nome_completo like :dado OR numero_cpf like :dado2 ORDER BY data_criacao desc";
            $stmt = $dbh->prepare($sql);
            $data = strval($dado);
            $stmt->bindValue(":dado", $data . "%");
            $stmt->bindValue(":dado2", $data . "%");
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return  $result;
        } catch (PDOException $e) {
            return "Error!: " . $e->getMessage() . "<br/>";
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
