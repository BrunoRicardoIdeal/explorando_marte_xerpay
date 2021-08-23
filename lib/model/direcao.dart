import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/class/conversor_enum_direcao.dart';
import 'package:explorando_marte_xerpay/model/char_enum.dart';

class Direcao extends CharEnum {
  Direcao(Enum pEnum) : super(pEnum);

  @override
  void iniciar() {
    conversorEnum = ConversorEnumDirecao();
    charArr = Constantes.arrCharDirecao;
    msgExcecaoNaoEncontrado = Constantes.msgErroDirecaoNaoEncontrada;

    super.iniciar();
  }
}
