import 'package:explorando_marte_xerpay/model/par_ordenado.dart';

class Malha {
  static final Malha _singleton = Malha._internal();
  final ParOrdenado _parOrdenadoLimiteInferior = ParOrdenado();
  final ParOrdenado parOrdenadoLimiteSuperior = ParOrdenado();

  factory Malha() {
    return _singleton;
  }

  Malha._internal();

  void definirLimiteSuperior(int pX, int pY) {
    parOrdenadoLimiteSuperior.x = pX;
    parOrdenadoLimiteSuperior.y = pY;
  }

  bool parEstaNosLimites(ParOrdenado pParOrdenado) {
    return (_parEstaNoLimiteInferior(pParOrdenado) &&
        _parEstaNoLimiteSuperior(pParOrdenado));
  }

  bool _parEstaNoLimiteInferior(ParOrdenado pParOrdenado) {
    return (pParOrdenado.x >= _parOrdenadoLimiteInferior.x) &&
        (pParOrdenado.y >= _parOrdenadoLimiteInferior.y);
  }

  bool _parEstaNoLimiteSuperior(ParOrdenado pParOrdenado) {
    return (pParOrdenado.x <= parOrdenadoLimiteSuperior.x) &&
        (pParOrdenado.y <= parOrdenadoLimiteSuperior.y);
  }

  @override
  String toString() {
    var s = 'limite inferior ${_parOrdenadoLimiteInferior.toString()}';
    s = s + ' limite superior ${parOrdenadoLimiteSuperior.toString()}';
    return s;
  }
}
