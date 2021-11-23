<?php

  /* A classe Evento abstrai um acontecimento que ocorre em determinado dia e hora,
  contido no atributo $dataHora ( você pode esperar que seja uma instância da
  classe DateTime  - ver https://www.php.net/manual/en/class.datetime) e um descrição
  que será uma string */
  
  class Evento{

    private $dataHora;
    private $descricao;

    public function __construct($dataHora, $descricao){
      $this->dataHora = is_string($dataHora) ? new DateTime($dataHora) : $dataHora;
      $this->descricao = $descricao;
    }

    public function getDataHora(){
      return $this->dataHora;
    }

    /* Esse método retorna os atributos em um array associativo para marshalização */
    public function getEstadoEmArrayAssociativo(){
      return [
        'descricao' => $this->descricao,
        'dataHora' => $this->dataHora->format(DATE_ISO8601)
      ];
    }
  }
?>
