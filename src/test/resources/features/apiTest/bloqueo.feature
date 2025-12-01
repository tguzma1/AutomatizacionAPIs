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
      | DIG482 | comercial | 453  | 03     | 8604621594    | 4037220014169166 | 403722 | 9166   | PREVENTIVO OFICINA     | U       | Error Generico                                                           | VPL5SCB17S | 200          |
      | DIG482 | comercial | 474  | 01     | 80797526      | 4864120066741011 | 486412 | 1011   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 486  | 03     | 8909006089    | 4302740012015382 | 430274 | 5382   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 486  | 03     | 9200018251    | 4302740015642620 | 430274 | 2620   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 430  | 05     | 303276        | 4599180052116729 | 459918 | 6729   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 430  | 02     | 203915        | 4599180008925231 | 459918 | 5231   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 617  | 02     | 204933        | 5201370037815126 | 520137 | 5126   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 617  | 01     | 80803174      | 5201370038467877 | 520137 | 7877   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 620  | 01     | 1144133200    | 5203540010023629 | 520354 | 3629   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 503  | 03     | 8604622854    | 4859354006309095 | 485935 | 9095   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 750  | 01     | 12000064035   | 5310880006289796 | 531088 | 9796   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 751  | 03     | 8604641110    | 5528650050475841 | 552865 | 5841   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 491  | 01     | 1022978441    | 4595050008102046 | 459505 | 2046   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 752  | 02     | 203815        | 5311220084043949 | 531122 | 3949   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 753  | 01     | 80802072      | 5311260081280649 | 531126 | 0649   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 467  | 03     | 8604656345    | 4076650006110814 | 407665 | 0814   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 465  | 01     | 807939143     | 4076650024789631 | 407665 | 9631   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 465  | 01     | 807939144     | 4076650028639345 | 407665 | 9345   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 440  | 05     | 303332        | 4010960016383999 | 401096 | 3999   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 474  | 05     | 302523        | 4864120039685683 | 486412 | 5683   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 451  | 01     | 94477645      | 4037220009373773 | 403722 | 3773   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 451  | 02     | 203046        | 4037220007092110 | 403722 | 2110   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 400  | 01     | 80795055      | 4506680368194122 | 450668 | 4122   | PREVENTIVO OFICINA     | U       | Transaccion Exitosa                                                      | 0          | 200          |
#      | DIG482 | comercial | 607  | 01     | 45473         | 5438620002594162 | 543862 | 4162   | PREVENTIVO BANCO       | P       | Transaccion Exitosa                                                      | 0          | 200          |
