component {
    /**
     * CONSTRUTOR DA ENTIDADE
     * O metodo 'init' é chamado no momento em que fazemos 'new Veiculo()'.
     * Ele recebe os dados brutos (arguments), gera um identificador único (UUID)
     * e guarda tudo na memória privada do objeto (escopo 'variables'), protegendo
     * os dados de serem alterados diretamente por outros arquivos.
     */
    public Veiculo function init(required string placa, required string modelo, required string marca, required boolean disponivel) {
        variables.id = createUUID();
        variables.placa = arguments.placa;
        variables.modelo = arguments.modelo;
        variables.marca = arguments.marca;
        variables.disponivel = arguments.disponivel;
        return this;
    }

    public struct function toStruct() {
        return {
            id: variables.id,
            placa: variables.placa,
            modelo: variables.modelo,
            marca: variables.marca,
            disponivel: variables.disponivel
        };
    }
}
