
component {

    private void function liberarCORS() {
    cfheader(name="Access-Control-Allow-Origin", value="*");
    }
    /**
     * ENDPOINT: Listar
     * A palavra 'remote' torna esta função acessível via URL (HTTP GET).
     * O 'returnFormat="json"' avisa o servidor para pegar o Array do ColdFusion
     * e convertê-lo automaticamente para o formato JSON.
     */
    remote array function listar() returnFormat="json" {
    liberarCORS();


    var repositorio = new adapters.database.FrotaRepository();
    var casoDeUso = new usecases.ListarFrota(repositorio);

    return casoDeUso.executar();
    }
}