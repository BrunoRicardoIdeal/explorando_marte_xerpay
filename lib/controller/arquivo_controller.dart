import 'dart:io';

import 'package:explorando_marte_xerpay/common/constantes.dart';

class ArquivoController {
  late File _arquivo;

  Future<List<String>> lerArquivo() async {
    String caminho = _obterCaminhoArquivo();
    _arquivo = File(caminho);

    var texto = await _arquivo.readAsString();
    return texto.split('\n');
  }

  String _obterCaminhoArquivo() {
    var diretorio = Directory.current;
    var pastaBin = Platform.pathSeparator + 'bin';
    var caminho = diretorio.path;
    caminho = caminho +
        (caminho.contains(pastaBin) ? '' : pastaBin) +
        Platform.pathSeparator +
        Constantes.nomePastaArquivoEntrada +
        Platform.pathSeparator +
        Constantes.nomeArquivoEntrada;
    return caminho;
  }
}
