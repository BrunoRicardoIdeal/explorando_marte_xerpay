import 'package:explorando_marte_xerpay/class/motor_sonda.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/model/comando.dart';
import 'package:explorando_marte_xerpay/model/direcao.dart';
import 'package:explorando_marte_xerpay/model/par_ordenado.dart';
import 'package:explorando_marte_xerpay/model/posicao.dart';
import 'package:explorando_marte_xerpay/model/sonda.dart';

class FabricaTestes {
  Posicao _obterPosicaoInicialValida() {
    Posicao posicao = Posicao(pX: 2, pY: 2);
    return posicao;
  }

  Sonda _obterSondaValida(EnumDirecao pEnumDirecao) {
    Sonda sonda = Sonda();
    sonda.posicao = _obterPosicaoInicialValida();
    sonda.posicao.direcao = Direcao(pEnumDirecao);

    return sonda;
  }

  List<dynamic> objetosParaGirarSonda(
      EnumComando enumComando, EnumDirecao pEnumDirecao) {
    MotorSonda motor = MotorSonda();
    Sonda sonda = _obterSondaValida(pEnumDirecao);
    Comando comando = Comando(enumComando);

    return [motor, sonda, comando];
  }

  List<dynamic> objetosParaDeslocarSonda(EnumDirecao pEnumDirecao) {
    MotorSonda motor = MotorSonda();
    Sonda sonda = _obterSondaValida(pEnumDirecao);

    return [motor, sonda];
  }
}
