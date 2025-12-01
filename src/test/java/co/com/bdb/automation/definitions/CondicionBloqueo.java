package co.com.bdb.automation.definitions;

import co.com.bdb.automation.utilities.CustomRequestSpecification;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasXPath;

public class CondicionBloqueo {

    private static final String URL_BASE = "http://10.86.154.122:3088";

    private static final String URL_PATH = "/creditcard/CreditCardBlockPreventiveManagement";


    private CustomRequestSpecification request;
    private final BaseTest baseTest;

    public CondicionBloqueo(BaseTest baseTest) {
        this.baseTest = baseTest;
    }

    @Given("bloquear TC con {int} desde el canal {string} producto {string}, tipo de dcto {string}, numeroDcto {long}, numero TC {string}, BIN {int}, ultimos cuatro TC {int}, descripcion del bloqueo {string}, bloqueo {string}")
    public void bloquearTCConDesdeElCanalProductoTipoDeDctoNumeroDctoNumeroTCBINUltimosCuatroTCDescripcionDelBloqueoBloqueo(
            Integer logo,
            String canal,
            String product,
            String typeId,
            Long participantId,
            String productId,
            Integer bin,
            Integer fourtc,
            String descrip,
            String bloqueo) throws IOException {

        String bodyTemplate = new String(Files.readAllBytes(Paths.get("src/test/resources/bodies/apiTest/soap/bloqueo.xml")), StandardCharsets.UTF_8);
        String bodyFinal = bodyTemplate
                .replace("${logo}", logo.toString())
                .replace("${canal}", canal)
                .replace("${product}", product)
                .replace("${typeId}", typeId)
                .replace("${participantId}", participantId.toString())
                .replace("${productId}", productId)
                .replace("${bin}", bin.toString())
                .replace("${fourtc}", fourtc.toString())
                .replace("${descrip}", descrip)
                .replace("${bloqueo}", bloqueo);


        System.out.println(bodyFinal);
        request = new CustomRequestSpecification(given().contentType(ContentType.XML)
                .baseUri(URL_BASE)
                .basePath(URL_PATH)
                .header("Content-Type", "text/xml;charset=UTF-8")
                .body(bodyFinal)
        );
    }

    @When("Ingresar datos en el  servicio CreditCardBlockPreventiveManagement operacion modCCBlockPreventiveBank")
    public void ingresar_datos_en_el_servicio_credit_card_block_preventive_management_operacion_mod_cc_block_preventive_bank() {
        baseTest.response = request.when().post();
    }

    @Then("se visualiza el StatusDesc con la descripcion {string}")
    public void seVisualizaElStatusDescConLaDescripcion(String statusDesc) {
        baseTest.response
                .then()
                .body(hasXPath("//*[local-name()='StatusDesc']", equalTo(statusDesc)));
    }

    @Then("verificar el status del servicio {string}")
    public void verificarElStatusDelServicio(String statusCode) {
        baseTest.response
                .then()
                .body(hasXPath("//*[local-name()='StatusCode']", equalTo(statusCode)));

    }

    @Then("Valido la respuesta del servicio tenga {int}")
    public void validoLaRespuestaDelServicioTenga(Integer statusServer) {
        baseTest.response.then().statusCode(statusServer);
        baseTest.response.prettyPrint();
    }

}
