@Refinanciacion
Feature: Realizar una novacion para la TC del cliente

  Scenario Outline: Refinanciar Pago Total TC
    Given envio de informacion con los campos canal "<canal>", productId <productId>, cardId "<cardId>",creditAuthType <creditAuthType> , creditType <creditType>, memo "<memo>", creditId <creditId>
    When Ingresar los datos
    Then se visualiza la siguiente StatusDesc con la descripcion "<descripcion>"
    And Valido que la respuesta del servicio tenga <statusServer>

    Examples:
      | canal | productId           | cardId              | creditAuthType | creditType | memo       | creditId | descripcion              | statusServer |
      | SMP   | 4746304925510580967 | 0004746300036295777 | 12             | 1          | Pago TOTAL | 39314    | Transaccion Exitosa      | 200          |
#      | SMP   | 4506684434786526463 | 0004506689470817975 | 24             | 2          | Pago TOTAL | 10925    | Transaccion Exitosa      | 200          |
#      | SMP   | 4506684055461442609 | 0004506689461969561 | 36             | 1          | Pago TOTAL | 12345    | REF/REST PLAN IS INVALID | 200          |
#      | SMP   | 5396126021067712853 | 0005396126079197780 | 12             | 1          | Pago TOTAL | 39310    | Transaccion Exitosa      | 200          |
#      | SMP   | 4595044900569808557 | 0004595040024999251 | 24             | 1          | Pago TOTAL | 10934    | Transaccion Exitosa      | 200          |
#      | SMP   | 5396126028085742523 | 0005396127403415757 | 36             | 1          | Pago TOTAL | 10914    | Transaccion Exitosa      | 200          |
#      | SMP   | 4595044905003460493 | 0004595040838571205 | 12             | 1          | Pago TOTAL | 10947    | Transaccion Exitosa      | 200          |
#      | SMP   | 5120696329494519807 | 0005120699463882756 | 24             | 1          | Pago TOTAL | 54321    | REF/REST PLAN IS INVALID | 200          |
#      | SMP   | 4145294964525798741 | 0004145291299099435 | 36             | 1          | Pago TOTAL | 10769    | Transaccion Exitosa      | 200          |
#      | SMP   | 4506684052336772815 | 0004506689464277194 | 12             | 1          | Pago TOTAL | 39315    | Transaccion Exitosa      | 200          |
#      | SMP   | 5396126025203073591 | 0005396127157648249 | 24             | 1          | Pago TOTAL | 39312    | Transaccion Exitosa      | 200          |
#      | SMP   | 4506684051805106877 | 0004506689462301194 | 36             | 1          | Pago TOTAL | 11013    | Transaccion Exitosa      | 200          |
#      | SMP   | 5396126021140565245 | 0005396125347586840 | 12             | 1          | Pago TOTAL | 10940    | Transaccion Exitosa      | 200          |
#      | SMP   | 4931104979927089203 | 0004931100023487113 | 24             | 1          | Pago TOTAL | 10768    | Transaccion Exitosa      | 200          |
#      | SMP   | 5528657519288304728 | 0005528650451442697 | 36             | 1          | Pago TOTAL | 39311    | Transaccion Exitosa      | 200          |
#      | SMP   | 5203546168633497145 | 0005203540030652761 | 24             | 1          | Pago TOTAL | 11011    | Transaccion Exitosa      | 200          |
#      | SMP   | 5438626073612083780 | 0005438620069662563 | 36             | 1          | Pago TOTAL | 39313    | Transaccion Exitosa      | 200          |
#      | SMP   | 4506684434058495165 | 0004506689475750056 | 12             | 1          | Pago TOTAL | 11111    | REF/REST PLAN IS INVALID | 200          |
#      | SMP   | 4599184307295046183 | 0004599180009231118 | 24             | 1          | Pago TOTAL | 11018    | Transaccion Exitosa      | 200          |
#      | SMP   | 4657704070008372893 | 0004657700066022818 | 36             | 1          | Pago TOTAL | 10770    | Transaccion Exitosa      | 200          |
#      | SMP   | 4575374157291386111 | 0004657700066022818 | 12             | 1          | Pago TOTAL | 00000    | REF/REST PLAN IS INVALID | 200          |
#      | SMP   | 4660904141376061939 | 0004660900361686458 | 24             | 1          | Pago TOTAL | 10799    | Transaccion Exitosa      | 200          |
#      | SMP   | 5201376177666543997 | 0005201370030299906 | 36             | 1          | Pago TOTAL | 10890    | Transaccion Exitosa      | 200          |
#      | SMP   | 5438626071396622864 | 0005438620174921334 | 12             | 1          | Pago TOTAL | 10889    | Transaccion Exitosa      | 200          |
#      | SMP   | 4865144683936455841 | 0004865140036146751 | 24             | 1          | Pago TOTAL | 10918    | Transaccion Exitosa      | 200          |
#      | SMP   | 4859355016657028264 | 0004859350049582813 | 36             | 1          | Pago TOTAL | 10933    | Transaccion Exitosa      | 200          |
#      | SMP   | 4145294964436081443 | 0004145290314519385 | 12             | 1          | Pago TOTAL | 40113    | Transaccion Exitosa      | 200          |
#      | SMP   | 4145294966038891533 | 0004145298933117226 | 24             | 1          | Pago TOTAL | 10930    | Transaccion Exitosa      | 200          |
#      | SMP   | 4599194941127151296 | 0004599197645350193 | 36             | 1          | Pago TOTAL | 10937    | Transaccion Exitosa      | 200          |
#      | SMP   | 4260454064986406125 | 0004260459464816920 | 12             | 1          | Pago TOTAL | 10941    | Transaccion Exitosa      | 200          |


