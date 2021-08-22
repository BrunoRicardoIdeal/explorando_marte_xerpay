import 'dart:io';

import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/controller/arquivo_controller.dart';
import 'package:test/test.dart';

class ArquivoControllerParaTestar extends ArquivoController {
  @override
  String obterCaminhoArquivo() {
    String caminho = super.obterCaminhoArquivo();
    return caminho.replaceAll(
        Constantes.nomeArquivoEntrada, Constantes.nomeArquivoEntradaTeste);
  }
}

main() {
  var controller = ArquivoControllerParaTestar();
  test('Consegue criar arquivo', () async {
    File file =
        await controller.criarArquivo(Constantes.nomeArquivoEntradaTeste);

    expect(await file.exists(), true);
  });
}
