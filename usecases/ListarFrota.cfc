component {
    public ListarFrota function init (required adapters.database.FrotaRepository repositorio) {
        variables.repositorio = arguments.repositorio;
        return this;
    }

public array function executar () {
        var frota = variables.repositorio.buscarTodos();
        return frota;
    }
}
