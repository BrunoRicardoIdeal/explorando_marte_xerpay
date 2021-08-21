import 'package:explorando_marte_xerpay/model/comando.dart';

abstract class Motor {
  void mover(pObj);
  void girar(pObj, Comando pComando);
}
