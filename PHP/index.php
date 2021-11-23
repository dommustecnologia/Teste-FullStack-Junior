<?php

  /*
  - Avaliação técnica para equipe de Desenvolvimento da Dommus (2021);
  - Esse exercício tem por objetivo analisar o conhecimento básico em PHP
  dos candidatos
  - No código abaixo, definimos um array contendo várias instâncias da classe Evento,
  contida nesse mesmo diretório; nós o atribuimos à um objeto da classe Agenda, na construção deste.
  - Desejamos imprimir, em formato JSON, todos os eventos em formato para transferência de
  estado que ocorrem no dia 26 de novembro, ordenados por hora.
  - Para isso você deve implementar a interface AgendaInterface na classe Agenda.
  - Siga os comentários iniciados em TODO na classe Agenda para completar a tarefa.
  - A saída esperada é um string JSON:
  [{"descricao":"Dommus Day","dataHora":"2021-11-26T09:00:00-0300"},{"descricao":"Almo\u00e7o no Z\u00e9 do Peixe","dataHora":"2021-11-26T12:30:00-0300"},{"descricao":"Sprint","dataHora":"2021-11-26T14:00:00-0300"}]
  */

  require_once __DIR__ . '/Agenda.php';

  $eventos = [
    new Evento('2021-12-31 00:00:00', 'Ano Novo'),
    new Evento('2021-12-24 00:00:00', 'Natal'),
    new Evento('2021-11-26 09:00:00', 'Dommus Day'),
    new Evento('2021-11-26 14:00:00', 'Sprint'),
    new Evento('2021-11-26 12:30:00', 'Almoço no Zé do Peixe')
  ];

  $agenda = new Agenda($eventos);

  echo "<pre>" . $agenda->imprimirJsonEventosDiaOrdenados('2021-11-26') . "</pre>";

?>
