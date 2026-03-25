/**
 * CASO DE USO: Cadastrar Veículo
 * -------------------------------------------------------------------
 */

component {
    /**
     * CONSTRUTOR / INJEÇÃO DE DEPENDÊNCIA
     * Recebe o repositório externo e o guarda na memória privada (variables)
     * para que a função 'executar' possa usá-lo depois.
     */
    public CadastrarVeiculo function init (required adapters.database.FrotaRepository repositorio) {
        variables.repositorio = arguments.repositorio;
        return this;
    }

    public struct function executar (required string placa, required string modelo, required string marca) {
        var veiculo = new domain.Veiculo().init(
            placa = arguments.placa,
            modelo = arguments.modelo,
            marca = arguments.marca,
            disponivel = true
        );

        variables.repositorio.salvar(veiculo);

        return veiculo.toStruct();
    }
}