import 'package:explorando_marte_xerpay/common/constantes.dart';

class ParOrdenado {
  int _x = 0;

  int get x => _x;

  set x(int x) {
    if (_coordenadaEhInvalida(x)) {
      throw Exception(Constantes.msgErroSomentePositivos);
    }
    _x = x;
  }

  int _y = 0;

  int get y => _y;

  set y(int y) {
    if (_coordenadaEhInvalida(y)) {
      throw Exception(Constantes.msgErroSomentePositivos);
    }
    _y = y;
  }

  bool _coordenadaEhInvalida(int pCoordenada) {
    return pCoordenada < 0;
  }

  void clonar(ParOrdenado pFonte) {
    x = pFonte.x;
    y = pFonte.y;
  }

  ParOrdenado({int pX = 0, int pY = 0}) {
    _x = pX;
    _y = pY;
  }

  @override
  String toString() {
    var s = '($_x, $_y)';
    return s;
  }
}
