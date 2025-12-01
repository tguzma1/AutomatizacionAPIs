package co.com.bdb.automation.definitions;

import co.com.bdb.automation.utilities.CustomRequestSpecification;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasXPath;

public class CondicionRefinance {

    private static final String URL_BASE = "http://10.86.154.122:3088";
    private static final String URL_PATH = "/creditcard/CreditCardAccountRestructureRefinanceManagement";
    private CustomRequestSpecification request;
    private final BaseTest baseTest;

    public CondicionRefinance(BaseTest baseTest) {
        this.baseTest = baseTest;
    }

    @Given("envio de informacion con los campos canal {string}, productId {long}, cardId {string},creditAuthType {int} , creditType {int}, memo {string}, creditId {int}")
    public void envioDeInformacionConLosCamposCanalProductIdCardIdCreditAuthTypeCreditTypeMemoCreditId(String canal, Long productId, String cardId, Integer creditAuthType, Integer creditType, String memo, Integer creditId) throws IOException {
        String bodyTemplate = new String(Files.readAllBytes(Paths.get("src/test/resources/bodies/apiTest/soap/bodyRefinance.xml")), StandardCharsets.UTF_8);
        String bodyFinal = bodyTemplate
                .replace("${canal}", canal)
                .replace("${productId}", productId.toString())
                .replace("${cardId}", cardId)
                .replace("${creditAuthType}", creditAuthType.toString())
                .replace("${creditType}", creditType.toString())
                .replace("${memo}", memo)
                .replace("${creditId}", creditId.toString());

        request = new CustomRequestSpecification(given()
                .baseUri(URL_BASE)
                .basePath(URL_PATH)
                .header("Content-Type", "text/xml;charset=UTF-8")
                .body(bodyFinal)
        );
    }

    @When("Ingresar los datos")
    public void ingresarLosDatos() {
        baseTest.response = request.when().post();
    }

    @Then("se visualiza la siguiente StatusDesc con la descripcion {string}")
    public void seVisualizaLaSiguienteStatusDescConLaDescripcion(String descripcion) {
        baseTest.response
                .then()
                .body(hasXPath("//*[local-name()='StatusDesc']", equalTo(descripcion)));

    }
    @And("Valido que la respuesta del servicio tenga {int}")
    public void validoQueLaRespuestaDelServicioTenga(Integer statusServer) {
        baseTest.response.then().statusCode(statusServer);
        baseTest.response.prettyPrint();
    }
}
