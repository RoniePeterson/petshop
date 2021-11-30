<?php
// session_start();
require_once('./EspeciesDAO.php');

class EspeciesService
{
    private $dao;

    public function __construct()
    {
      $this->dao = new EspeciesDAO();
    }

    public function listAll()
    {
        return $this->dao->listAll();
    }

    public function listOne($dado)
    {
        $resultado = $this->dao->listOne($dado);
        if ($resultado == false) {
            return NULL;
        }
        return $resultado;
    }

    public function findByUuid($uuid)
    {
        $resultado = $this->dao->findByUuid($uuid);
        if ($resultado == false) {
            return NULL;
        }
        return $resultado;
    }

    public function store($data)
    {
        try {
            $resultado = $this->dao->store($data);
            if ($resultado == false) {
                return [
                    "data" => "Erro ao inserir as informações. Tente mais tarde."
                ];
            }
        } catch (Exception $e) {
            throw $e;
        }
    }

    public function updateEnviouEmailTrue($uuid)
    {
        $resultado = $this->dao->updateEnviouEmailTrue($uuid);
        if ($resultado == false) {
            return [
                "data" => "Erro ao atualizar as informações. Tente mais tarde."
            ];
        }
    }

}
