import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/controller/arquivo_controller.dart';
import 'package:explorando_marte_xerpay/controller/sonda_controller.dart';
import 'package:explorando_marte_xerpay/class/conversor_enum_comando.dart';
import 'package:explorando_marte_xerpay/model/comando.dart';
import 'package:explorando_marte_xerpay/model/malha.dart';
import 'package:explorando_marte_xerpay/model/sonda.dart';

class Leitor {
  ArquivoController arquivoController = ArquivoController();
  final SondaController _sondaController;
  List<String> linhas = [];

  Leitor(
    this._sondaController,
  );

  bool _arquivoEhCoerenteComOContrato(List<String> pLinhas) {
    bool coerente = true;
    String cadeiaValida = '0123456789LM ';
    for (var linha in linhas) {
      for (var rune in linha.runes) {
        var caractere = String.fromCharCode(rune);
        coerente = (cadeiaValida.contains(caractere));
      }
    }

    return coerente;
  }

  Future<void> lerArquivo() async {
    linhas = await arquivoController.lerArquivo();
    for (int i = 0; i < linhas.length; i++) {
      var linha = linhas[i];
      if (!_arquivoEhCoerenteComOContrato(linhas)) {
        throw Exception(Constantes.msgErroArquivoForaDoContrato);
      }
      if (i == 0) {
        _lerLimiteSuperiorDaMalha(linha);
        continue;
      }
      _lerEntradasDeSondas(i, linha);
    }
  }

  void _lerLimiteSuperiorDaMalha(String pLinha) {
    var limiteMalha = pLinha;
    var split = limiteMalha.split(" ");
    if (split.length != 2) {
      throw Exception(Constantes.msgErroEntradaDefinicaoMalhaInvalida);
    }

    var x = split[0];
    var y = split[1];
    Malha().definirLimiteSuperior(int.parse(x), int.parse(y));
  }

  bool _ehPosicaoDaSonda(int pIndice) {
    return (pIndice % 2) != 0;
  }

  void _lerEntradasDeSondas(int pIndice, String pLinha) {
    if (_ehPosicaoDaSonda(pIndice)) {
      _lerPosicaoSonda(pLinha);
    } else {
      _lerComandosSonda(pLinha);
    }
  }

  void _lerPosicaoSonda(String pLinha) {
    var dadosSonda = pLinha;
    var split = dadosSonda.split(' ');
    int x = 0;
    int y = 0;
    String direcaoStr = '';
    try {
      x = int.parse(split[0]);
      y = int.parse(split[1]);
      direcaoStr = split[2];
    } catch (e) {
      throw Exception(Constantes.msgErroPosicaoInvalida);
    }

    _sondaController.novaSonda(x, y, direcaoStr);
  }

  void _lerComandosSonda(String pLinha) {
    List<Comando> comandos = [];
    for (int i = 0; i < pLinha.length; i++) {
      var comandoStr = pLinha[i].trim();
      if (!Constantes.arrCharComando.contains(comandoStr)) continue;
      EnumComando enumComando =
          ConversorEnumComando().toEnum(comandoStr) as EnumComando;
      Comando comando = Comando(enumComando);
      comandos.add(comando);
    }
    Sonda sonda = _sondaController.ultimaSonda();
    _sondaController.novoProcedimento(sonda, comandos);
  }
}
