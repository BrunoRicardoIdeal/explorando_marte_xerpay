class Constantes {
  // Mensagens
  static final String msgErroSomentePositivos =
      'Apenas números positivos são permitidos.';
  static final String msgErroIndiceInvalido = 'Índice inválido.';
  static final String msgErroDirecaoNaoEncontrada =
      'A direção informada não foi encontrada.';
  static final String msgErroComandoInvalido = 'O comando informado é inválido';
  static final String msgErroSondaInvalida = 'A sonda informada é inválida';
  static final String msgComandoGiroInvalido =
      'O comando de giro deve ser R ou L.';
  static final String msgErroEntradaDefinicaoMalhaInvalida =
      'A entrada de definição de malha é inválida';
  static final String msgErroArquivoForaDoContrato =
      'O arquivo de entrada está em desacordo com o contrato.';
  static final String msgErroMovimentoAbortado =
      'Movimento abortado! Com o próximo movimento a sonda iria para fora da malha conhecida.';
  static final String msgErroPosicaoInvalida =
      'A posição informada é inválida.';

  //Chars
  static const charDirecaoN = 'N';
  static const charDirecaoE = 'E';
  static const charDirecaoS = 'S';
  static const charDirecaoW = 'W';
  static const charComandoL = 'L';
  static const charComandoR = 'R';
  static const charComandoM = 'M';

  // Arrays
  static const arrCharDirecao = [
    charDirecaoN,
    charDirecaoE,
    charDirecaoS,
    charDirecaoW
  ];
  static const arrCharComando = [charComandoL, charComandoR, charComandoM];

  // Arquivos e diretórios
  static const nomeArquivoEntrada = 'entrada.txt';
  static const nomeArquivoEntradaTeste = 'entrada_teste.txt';
  static const nomePastaArquivoEntrada = 'entrada';
}
