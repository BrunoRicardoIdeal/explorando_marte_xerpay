import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/model/direcao.dart';
import 'package:explorando_marte_xerpay/model/par_ordenado.dart';

class Posicao {
  ParOrdenado parOrdenado = ParOrdenado();
  Direcao direcao = Direcao(EnumDirecao.direcaoN);

  @override
  String toString() {
    return '${parOrdenado.x}, ${parOrdenado.y}, ${direcao.obterString()}';
  }

  Posicao({int? pX, int? pY}) {
    if (pX != null) parOrdenado.x = pX;
    if (pY != null) parOrdenado.y = pY;
  }
}
