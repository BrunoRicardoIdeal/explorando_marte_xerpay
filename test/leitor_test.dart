import 'package:explorando_marte_xerpay/class/leitor.dart';
import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/controller/sonda_controller.dart';
import 'package:test/test.dart';

import 'arquivo_controller_test.dart';

main() {
  var _arquivoController = ArquivoControllerParaTestar();
  var _leitor = Leitor(SondaController());
  _leitor.arquivoController = _arquivoController;

  test('Ler arquivo válido não ocasiona erro', () async {
    bool ok = false;
    const texto = '5 5\n1 2 N\nLMLMLMLMM';

    await _arquivoController.criarArquivo(
        Constantes.nomeArquivoEntradaTeste, texto);
    await _leitor.lerArquivo();

    ok = true;

    expect(ok, true);
  });

  test('Ler arquivo vazio ocasiona exceção', () async {
    const texto = '';

    await _arquivoController.criarArquivo(
        Constantes.nomeArquivoEntradaTeste, texto);

    expectLater(() => _leitor.lerArquivo(), throwsException);
  });

  test('Ler arquivo com caracteres inválidos ocasiona exceção', () async {
    const texto = '12140A 1A424210 A1S11D0';

    await _arquivoController.criarArquivo(
        Constantes.nomeArquivoEntradaTeste, texto);

    expectLater(() => _leitor.lerArquivo(), throwsException);
  });
}
