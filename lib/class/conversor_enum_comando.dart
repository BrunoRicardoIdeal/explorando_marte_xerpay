import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/class/conversor_enum.dart';

class ConversorEnumComando implements ConversorEnum {
  @override
  Enum toEnum(String pStr) {
    switch (pStr) {
      case Constantes.charComandoL:
        return EnumComando.comandoL;
      case Constantes.charComandoR:
        return EnumComando.comandoR;
      case Constantes.charComandoM:
        return EnumComando.comandoM;
      default:
        throw Exception(Constantes.msgErroComandoInvalido);
    }
  }

  @override
  String toStr(Enum pEnum) {
    return Constantes.arrCharComando[pEnum.index];
  }
}
