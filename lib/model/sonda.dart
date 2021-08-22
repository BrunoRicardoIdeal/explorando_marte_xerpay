import 'package:explorando_marte_xerpay/model/posicao.dart';

class Sonda {
  Posicao posicao = Posicao();
  bool emTerra = false;

  @override
  String toString() {
    return posicao.toString();
  }
}
