import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/class/conversor_enum_comando.dart';

class Comando {
  EnumComando _comandoEnum = EnumComando.comandoL;
  String _comando = '';

  void atribuir(EnumComando pEnumComando) {
    String c = _obterChar(pEnumComando);
    _comando = c;
    _comandoEnum = ConversorEnumComando().toEnum(_comando) as EnumComando;
  }

  String obterString() {
    return _comando;
  }

  EnumComando obterEnum() {
    return _comandoEnum;
  }

  String _obterChar(EnumComando pEnumComando) {
    try {
      return Constantes.arrCharComando[pEnumComando.index];
    } catch (e) {
      throw Exception(Constantes.msgErroDirecaoNaoEncontrada);
    }
  }

  Comando(EnumComando pEnumComando) {
    atribuir(pEnumComando);
  }
}
