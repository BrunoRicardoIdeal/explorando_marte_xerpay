import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/class/conversor_enum_direcao.dart';

class Direcao {
  EnumDirecao _direcaoEnum = EnumDirecao.direcaoN;
  String _direcao = '';

  void atribuir(EnumDirecao pEnumDirecao) {
    String d = _obterChar(pEnumDirecao);
    _direcao = d;
    _direcaoEnum = ConversorEnumDirecao().toEnum(_direcao) as EnumDirecao;
  }

  String obterString() {
    return _direcao;
  }

  EnumDirecao obterEnum() {
    return _direcaoEnum;
  }

  String _obterChar(EnumDirecao pEnumDirecao) {
    try {
      return Constantes.arrCharDirecao[pEnumDirecao.index];
    } catch (e) {
      throw Exception(Constantes.msgErroDirecaoNaoEncontrada);
    }
  }

  Direcao(EnumDirecao pEnumDirecao) {
    atribuir(pEnumDirecao);
  }
}
