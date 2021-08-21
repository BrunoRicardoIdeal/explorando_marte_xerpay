import 'package:explorando_marte_xerpay/class/motor.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/model/comando.dart';
import 'package:explorando_marte_xerpay/model/malha.dart';
import 'package:explorando_marte_xerpay/model/sonda.dart';
import 'package:test/test.dart';

import 'fabrica_testes.dart';

void main() {
  FabricaTestes fabricaTestes = FabricaTestes();
  Malha().definirLimiteSuperior(10, 10);
  test('Girar sonda para direita partindo de N', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoR, EnumDirecao.direcaoN);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    motorSonda.girar(sonda, comando);

    expect(sonda.posicao.direcao.obterEnum(), EnumDirecao.direcaoE);
  });

  test('Girar sonda para direita partindo de E', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoR, EnumDirecao.direcaoE);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    motorSonda.girar(sonda, comando);

    expect(sonda.posicao.direcao.obterEnum(), EnumDirecao.direcaoS);
  });

  test('Girar sonda para direita partindo de S', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoR, EnumDirecao.direcaoS);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    motorSonda.girar(sonda, comando);

    expect(sonda.posicao.direcao.obterEnum(), EnumDirecao.direcaoW);
  });

  test('Girar sonda para direita partindo de W', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoR, EnumDirecao.direcaoW);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    motorSonda.girar(sonda, comando);

    expect(sonda.posicao.direcao.obterEnum(), EnumDirecao.direcaoN);
  });

  test('Girar sonda para esquerda partindo de N', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoL, EnumDirecao.direcaoN);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    motorSonda.girar(sonda, comando);

    expect(sonda.posicao.direcao.obterEnum(), EnumDirecao.direcaoW);
  });

  test('Girar sonda para esquerda partindo de E', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoL, EnumDirecao.direcaoE);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    motorSonda.girar(sonda, comando);

    expect(sonda.posicao.direcao.obterEnum(), EnumDirecao.direcaoN);
  });

  test('Girar sonda para esquerda partindo de S', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoL, EnumDirecao.direcaoS);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    motorSonda.girar(sonda, comando);

    expect(sonda.posicao.direcao.obterEnum(), EnumDirecao.direcaoE);
  });

  test('Girar sonda para esquerda partindo de W', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoL, EnumDirecao.direcaoW);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    motorSonda.girar(sonda, comando);

    expect(sonda.posicao.direcao.obterEnum(), EnumDirecao.direcaoS);
  });

  test('Mover sonda virada para N', () {
    List<dynamic> objetos =
        fabricaTestes.objetosParaDeslocarSonda(EnumDirecao.direcaoN);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];

    int y = sonda.posicao.parOrdenado.y;
    motorSonda.mover(sonda);

    expect(sonda.posicao.parOrdenado.y, y + 1);
  });

  test('Mover sonda virada para E', () {
    List<dynamic> objetos =
        fabricaTestes.objetosParaDeslocarSonda(EnumDirecao.direcaoE);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];

    int x = sonda.posicao.parOrdenado.x;
    motorSonda.mover(sonda);

    expect(sonda.posicao.parOrdenado.x, x + 1);
  });

  test('Mover sonda virada para S', () {
    List<dynamic> objetos =
        fabricaTestes.objetosParaDeslocarSonda(EnumDirecao.direcaoS);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];

    int y = sonda.posicao.parOrdenado.y;
    motorSonda.mover(sonda);

    expect(sonda.posicao.parOrdenado.y, y - 1);
  });

  test('Mover sonda virada para S', () {
    List<dynamic> objetos =
        fabricaTestes.objetosParaDeslocarSonda(EnumDirecao.direcaoW);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];

    int x = sonda.posicao.parOrdenado.x;
    motorSonda.mover(sonda);

    expect(sonda.posicao.parOrdenado.x, x - 1);
  });

  test('Girar com comando inválido lança exceção', () {
    List<dynamic> objetos = fabricaTestes.objetosParaGirarSonda(
        EnumComando.comandoM, EnumDirecao.direcaoN);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Comando comando = objetos[2];

    expect(() => motorSonda.girar(sonda, comando), throwsException);
  });

  test('Navegar para fora da malha lança exceção', () {
    List<dynamic> objetos =
        fabricaTestes.objetosParaDeslocarSonda(EnumDirecao.direcaoN);

    Motor motorSonda = objetos[0];
    Sonda sonda = objetos[1];
    Malha().definirLimiteSuperior(
        sonda.posicao.parOrdenado.x, sonda.posicao.parOrdenado.y);

    expect(() => motorSonda.mover(sonda), throwsException);
  });
}
