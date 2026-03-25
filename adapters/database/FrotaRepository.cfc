component {

    public FrotaRepository function init() {
        return this;
    }

    public void function salvar(required struct veiculo) {
        application.frota.append(arguments.veiculo);
    }

    public array function buscarTodos() {
        return application.frota;
    }

    public boolean function remover(required string id) {
        var tamanhoOriginal = application.frota.len();

        application.frota = application.frota.filter(function(item) {
            return item.id != arguments.id;
        });

        return application.frota.len() < tamanhoOriginal;
    }
}