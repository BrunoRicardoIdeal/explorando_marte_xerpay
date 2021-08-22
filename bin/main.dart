import 'package:explorando_marte_xerpay/class/leitor.dart';
import 'package:explorando_marte_xerpay/controller/sonda_controller.dart';

void main(List<String> arguments) async {
  SondaController _sondaController = SondaController();
  Leitor leitor = Leitor(_sondaController);

  await leitor.lerArquivo();

  _sondaController.executarProcedimentos();
  _sondaController.escreverPosicoesFinais();
  _sondaController.pousarSondas();
}
