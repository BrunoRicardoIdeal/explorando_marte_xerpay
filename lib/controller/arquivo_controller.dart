import 'dart:io';

import 'package:explorando_marte_xerpay/common/constantes.dart';

class ArquivoController {
  late File _arquivo;

  Future<List<String>> lerArquivo() async {
    String caminho = obterCaminhoArquivo();
    if (!await File(caminho).exists()) criarArquivo();
    _arquivo = File(caminho);

    var texto = await _arquivo.readAsString();
    return texto.split('\n');
  }

  Future<File> criarArquivo(
      [String pNome = '', String pTextoAEscrever = '']) async {
    String caminho = obterCaminhoArquivo().replaceAll(
        Constantes.nomeArquivoEntrada,
        pNome.isEmpty ? Constantes.nomeArquivoEntrada : pNome);
    return await File(caminho).writeAsString(pTextoAEscrever);
  }

  String obterCaminhoArquivo() {
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
