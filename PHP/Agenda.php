<?php
  require_once __DIR__ . '/AgendaInterface.php';
  require_once __DIR__ . '/Evento.php';

  /*
    Classe que abstrai uma agenda; consiste de uma composição simples de eventos.
    Implemente o método privado para filtrar os eventos por dia e o método da AgendaInterface
    para gerar o json ordenado.
  */

  class Agenda implements AgendaInterface{

    private $eventos = [];
    public function __construct($eventos){
      $this->eventos = $eventos;
    }

    // TODO implementar o método "imprimirJsonEventosDiaOrdenados" da AgendaInterface
    // o faça utilizar o método privado filtrarEventosDia que você implementou para
    // obter os eventos do dia; para ordená los use a função nativa usort https://www.php.net/manual/en/function.usort
    // com uma closure para comparação; retorne uma string json com um array de
    // eventos formatados pelo método getEstadoEmArrayAssociativo na classe Evento



    private function filtrarEventosDia($dataHoraDia){
      // TODO implementar o método que filtrará os eventos do estado da Agenda,
      // retornando apenas os da data informada por parâmetro - sem alterar o estado
      // do objeto Agenda
    }
  }
?>
