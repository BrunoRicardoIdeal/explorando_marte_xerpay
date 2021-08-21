import 'package:explorando_marte_xerpay/model/malha.dart';
import 'package:explorando_marte_xerpay/model/par_ordenado.dart';
import 'package:test/test.dart';

main() {
  Malha().definirLimiteSuperior(5, 5);
  test('Par está dentro dos limites', () {
    ParOrdenado par = ParOrdenado(pX: 2, pY: 2);

    var b = Malha().parEstaNosLimites(par);
    expect(b, true);
  });

  test('Par está fora dos limites', () {
    ParOrdenado par = ParOrdenado(
        pX: Malha().parOrdenadoLimiteSuperior.x + 1,
        pY: Malha().parOrdenadoLimiteSuperior.y + 1);

    var b = Malha().parEstaNosLimites(par);
    expect(b, false);
  });
}
