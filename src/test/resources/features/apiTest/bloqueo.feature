@Bloqueo
Feature:Prueba bloqueo TC personal y Comercial

  Scenario Outline: Realizar bloqueo temporal a TC Personal
    Given bloquear TC con <logo> desde el canal "<canal>" producto "<product>", tipo de dcto "<typeId>", numeroDcto <participantId>, numero TC "<productId>", BIN <bin>, ultimos cuatro TC <fourtc>, descripcion del bloqueo "<descrip>", bloqueo "<bloqueo>"
    When Ingresar datos en el  servicio CreditCardBlockPreventiveManagement operacion modCCBlockPreventiveBank
    Then se visualiza el StatusDesc con la descripcion "<statusDesc>"
    And verificar el status del servicio "<statusCode>"
    And Valido la respuesta del servicio tenga <statusServer>

    Examples:
      | canal  | product   | logo | typeId | participantId | productId        | bin    | fourtc | descrip                | bloqueo | statusDesc                                                               | statusCode | statusServer |
      | dig482 | comercial | 440  | 01     | 19801115      | 4010960009035630 | 401096 | 5630   | PREVENTIVO BANCO       | U       | Fallas Tecnicas nos impiden procesar la Transaccion                      | 100        | 500          |
      | DIG482 | comercial | 474  | 04     | 9905110142    | 4864120063213196 | 486412 | 3196   | PREVENTIVO BANCO       | U       | CLIENTE O CUENTA O TARJETA NO EXISTE, VALIDE DATOS                       | 1050       | 200          |
      | DIG482 | comercial | 451  | 01     | 807940088     | 4037220001935256 | 403722 | 5256   | PREVENTIVO BANCO       | U       | LA SOLICITUD NO PUEDE SER PORCESADA, LA TARJETA DE CREDITO ESTA INACTIVA | 13         | 200          |
      | DIG482 | comercial | 980  | 01     | 2000371       | 8506680000059774 | 850668 | 9774   | PREVENTIVO OFICINA     | P       | REQUESTED CARD / ACCOUNT NUMBER IS NOT FOUND                             | VPL5SCI05S | 200          |
      | DIG482 | comercial | 400  | 02     | 324014        | 4506680000059774 | 450668 | 9774   | CASTIGADA              | Z       | Tiempo de espera para la respuesta superado                              | 300        | 500          |
      | DIG482 | comercial | 607  | 02     | 202101        | 5438620482009343 | 543862 | 9343   | CANCELATORIOS PRODUCTO | Y       | Tiempo de espera para la respuesta superado                              | 300        | 500          |
      | DIG482 | comercial | 453  | 03     | 8604621594    | 4037220014169166 | 403722 | 9166   | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 474  | 03     | 8604666199    | 4864120087528983 | 486412 | 8983   | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 486  | 03     | 8909006089    | 4302740012015382 | 430274 | 5382   | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 486  | 03     | 9200018251    | 4302740015642620 | 430274 | 2620   | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 491  | 01     | 1022978441    | 4595050008102046 | 459505 | 2046   | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 430  | 05     | 303276        | 4599180052116729 | 459918 | 6729   | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 430  | 02     | 203915        | 4599180008925231 | 459918 | 5231   | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 617  | 02     | 204933        | 5201370037815126 | 520137 | 5126   | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 617  | 01     | 80803174      | 5201370038467877 | 520137 | 7877   | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 620  | 01     | 1144133200    | 5203540010023629 | 520354 | 3629   | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 505  |        |               |                  |        |        | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 750  |        |               |                  |        |        | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 751  |        |               |                  |        |        | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 752  |        |               |                  |        |        | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 753  |        |               |                  |        |        | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 467  |        |               |                  |        |        | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 592  |        |               |                  |        |        | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 465  |        |               |                  |        |        | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 440  |        |               |                  |        |        | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 474  |        |               |                  |        |        | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 451  |        |               |                  |        |        | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 980  |        |               |                  |        |        | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 400  |        |               |                  |        |        | PREVENTIVO OFICINA     | U       | Transaccion Exitoso                                                      | 0          | 200          |
      | DIG482 | comercial | 607  |        |               |                  |        |        | PREVENTIVO BANCO       | P       | Transaccion Exitoso                                                      | 0          | 200          |
