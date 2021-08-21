import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/class/conversor_enum.dart';

class ConversorEnumDirecao implements ConversorEnum {
  @override
  Enum toEnum(String pStr) {
    switch (pStr[0]) {
      case Constantes.charDirecaoN:
        return EnumDirecao.direcaoN;
      case Constantes.charDirecaoE:
        return EnumDirecao.direcaoE;
      case Constantes.charDirecaoS:
        return EnumDirecao.direcaoS;
      case Constantes.charDirecaoW:
        return EnumDirecao.direcaoW;
      default:
        throw Exception(Constantes.msgErroDirecaoNaoEncontrada + ': $pStr');
    }
  }

  @override
  String toStr(Enum pEnum) {
    return Constantes.arrCharDirecao[pEnum.index];
  }
}
