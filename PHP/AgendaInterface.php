<?php

  interface AgendaInterface{
    // Método que imprime um array json com os eventos ordenados por data e hora
    // crescente.
    public function imprimirJsonEventosDiaOrdenados($dataHoraDia);
  }

?>
