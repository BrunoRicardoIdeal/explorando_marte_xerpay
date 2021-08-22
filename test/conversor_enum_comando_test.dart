import 'package:explorando_marte_xerpay/class/conversor_enum_comando.dart';
import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:test/test.dart';

main() {
  var conversor = ConversorEnumComando();
  test('Converte comandos L', () {
    var str = conversor.toStr(EnumComando.comandoL);
    var enumcomando = conversor.toEnum(Constantes.charComandoL);
    bool ok = (str == Constantes.charComandoL) &&
        (enumcomando == EnumComando.comandoL);

    expect(ok, true);
  });

  test('Converte comandos R', () {
    var str = conversor.toStr(EnumComando.comandoR);
    var enumcomando = conversor.toEnum(Constantes.charComandoR);
    bool ok = (str == Constantes.charComandoR) &&
        (enumcomando == EnumComando.comandoR);

    expect(ok, true);
  });

  test('Converte comandos M', () {
    var str = conversor.toStr(EnumComando.comandoM);
    var enumcomando = conversor.toEnum(Constantes.charComandoM);
    bool ok = (str == Constantes.charComandoM) &&
        (enumcomando == EnumComando.comandoM);

    expect(ok, true);
  });

  test('Converter comando inválido gera exceção', () {
    const str = 'K';

    expect(() => conversor.toEnum(str), throwsException);
  });
}
