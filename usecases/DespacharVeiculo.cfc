component {
    public DespacharVeiculo function init (required adapters.database.FrotaRepository repositorio) {
        variables.repositorio = arguments.repositorio;
        return this;
    }

    public struct function executar (required string placa) {
        var frota = variables.repositorio.buscarTodos();
        var veiculo = arrayFind(frota, function(item) {
            return item.placa == arguments.placa;
        });

        if (isDefined("veiculo") && veiculo.disponivel) {
            veiculo.disponivel = false;
            variables.repositorio.salvar(veiculo);
            return { success: true, message: "Veículo despachado com sucesso." };
        } else if (isDefined("veiculo")) {
            return { success: false, message: "Veículo já está despachado." };
        } else {
            return { success: false, message: "Veículo não encontrado." };
        }
    }
}