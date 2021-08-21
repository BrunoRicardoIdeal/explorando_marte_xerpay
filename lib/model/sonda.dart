import 'package:explorando_marte_xerpay/model/posicao.dart';

class Sonda {
  Posicao posicao = Posicao();

  @override
  String toString() {
    return posicao.toString();
  }
}
