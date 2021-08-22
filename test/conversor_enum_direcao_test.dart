import 'package:explorando_marte_xerpay/class/conversor_enum_direcao.dart';
import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:test/test.dart';

main() {
  var conversor = ConversorEnumDirecao();
  test('Converte direcoes N', () {
    var str = conversor.toStr(EnumDirecao.direcaoN);
    var enumdirecao = conversor.toEnum(Constantes.charDirecaoN);
    bool ok = (str == Constantes.charDirecaoN) &&
        (enumdirecao == EnumDirecao.direcaoN);

    expect(ok, true);
  });

  test('Converte direcoes E', () {
    var str = conversor.toStr(EnumDirecao.direcaoE);
    var enumdirecao = conversor.toEnum(Constantes.charDirecaoE);
    bool ok = (str == Constantes.charDirecaoE) &&
        (enumdirecao == EnumDirecao.direcaoE);

    expect(ok, true);
  });

  test('Converte direcoes S', () {
    var str = conversor.toStr(EnumDirecao.direcaoS);
    var enumdirecao = conversor.toEnum(Constantes.charDirecaoS);
    bool ok = (str == Constantes.charDirecaoS) &&
        (enumdirecao == EnumDirecao.direcaoS);

    expect(ok, true);
  });

  test('Converte direcoes W', () {
    var str = conversor.toStr(EnumDirecao.direcaoW);
    var enumdirecao = conversor.toEnum(Constantes.charDirecaoW);
    bool ok = (str == Constantes.charDirecaoW) &&
        (enumdirecao == EnumDirecao.direcaoW);

    expect(ok, true);
  });

  test('Converter direcao invalida gera exceção', () {
    var str = 'K';

    expect(() => conversor.toEnum(str), throwsException);
  });
}
