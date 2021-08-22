import 'package:explorando_marte_xerpay/class/leitor.dart';
import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/controller/sonda_controller.dart';
import 'package:explorando_marte_xerpay/model/posicao.dart';
import 'package:test/test.dart';

import 'arquivo_controller_test.dart';

main() {
  var _arquivoController = ArquivoControllerParaTestar();
  var _sondaController = SondaController();
  var _leitor = Leitor(_sondaController);
  _leitor.arquivoController = _arquivoController;

  test('Posicao final simples [A] está correta', () async {
    bool ok = false;
    const texto = '5 5\n1 2 N\nLMLMLMLMM';

    await _arquivoController.criarArquivo(
        Constantes.nomeArquivoEntradaTeste, texto);
    await _leitor.lerArquivo();

    _sondaController.executarProcedimentos();

    Posicao pos = _sondaController.ultimaSonda().posicao;
    ok = (pos.parOrdenado.x == 1) &&
        (pos.parOrdenado.y == 3) &&
        (pos.direcao.obterEnum() == EnumDirecao.direcaoN);

    expect(ok, true);
  });

  test('Posicao final simples [B] está correta', () async {
    bool ok = false;
    const texto = '5 5\n3 3 E\nMMRMMRMRRM';

    await _arquivoController.criarArquivo(
        Constantes.nomeArquivoEntradaTeste, texto);
    await _leitor.lerArquivo();

    _sondaController.executarProcedimentos();

    Posicao pos = _sondaController.ultimaSonda().posicao;
    ok = (pos.parOrdenado.x == 5) &&
        (pos.parOrdenado.y == 1) &&
        (pos.direcao.obterEnum() == EnumDirecao.direcaoE);

    expect(ok, true);
  });

  test('Posicao final simples [C] está correta', () async {
    bool ok = false;
    const texto = '5 5\n1 1 N\nRMLM';

    await _arquivoController.criarArquivo(
        Constantes.nomeArquivoEntradaTeste, texto);
    await _leitor.lerArquivo();

    _sondaController.executarProcedimentos();

    Posicao pos = _sondaController.ultimaSonda().posicao;
    ok = (pos.parOrdenado.x == 2) &&
        (pos.parOrdenado.y == 2) &&
        (pos.direcao.obterEnum() == EnumDirecao.direcaoN);

    expect(ok, true);
  });

  test('Saídas variadas estão corretas', () async {
    bool ok = false;
    const texto = '5 5\n1 1 N\nRMLM\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM';
    _sondaController.limparSondas();

    await _arquivoController.criarArquivo(
        Constantes.nomeArquivoEntradaTeste, texto);
    await _leitor.lerArquivo();

    _sondaController.executarProcedimentos();

    var lista = _sondaController.obterPosicoesFinaisEmLista();
    ok = (lista[0] == '2, 2, N') &&
        (lista[1] == '1, 3, N') &&
        (lista[2] == '5, 1, E');

    expect(ok, true);
  });
}
