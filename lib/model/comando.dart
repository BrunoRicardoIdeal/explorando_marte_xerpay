import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/class/conversor_enum_comando.dart';
import 'package:explorando_marte_xerpay/model/char_enum.dart';

class Comando extends CharEnum {
  Comando(Enum pEnum) : super(pEnum);

  @override
  void iniciar() {
    conversorEnum = ConversorEnumComando();
    charArr = Constantes.arrCharComando;
    msgExcecaoNaoEncontrado = Constantes.msgErroComandoInvalido;

    super.iniciar();
  }
}
