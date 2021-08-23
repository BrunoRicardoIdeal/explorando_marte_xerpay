import 'package:explorando_marte_xerpay/class/conversor_enum.dart';

class CharEnum {
  late Enum enumerado;
  String caractere = '';
  late ConversorEnum conversorEnum;
  List<String> charArr = [];
  String msgExcecaoNaoEncontrado = '';

  void iniciar() {
    atribuir(enumerado);
  }

  void atribuir(Enum pEnum) {
    String c = _obterChar(pEnum);
    caractere = c;
    enumerado = conversorEnum.toEnum(caractere);
  }

  String obterString() {
    return caractere;
  }

  Enum obterEnum() {
    return enumerado;
  }

  String _obterChar(Enum pEnum) {
    try {
      return charArr[pEnum.index];
    } catch (e) {
      throw Exception(msgExcecaoNaoEncontrado);
    }
  }

  CharEnum(Enum pEnum) {
    enumerado = pEnum;
    iniciar();
  }
}
