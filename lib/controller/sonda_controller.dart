import 'package:explorando_marte_xerpay/class/motor_sonda.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/class/conversor_enum_direcao.dart';
import 'package:explorando_marte_xerpay/model/comando.dart';
import 'package:explorando_marte_xerpay/model/malha.dart';
import 'package:explorando_marte_xerpay/model/procedimento.dart';
import 'package:explorando_marte_xerpay/model/sonda.dart';

class SondaController {
  final List<Sonda> _sondas = [];
  final List<Procedimento> _procedimentos = [];
  final MotorSonda _motorSonda = MotorSonda();

  Sonda novaSonda(int pX, int pY, String pDirecaoStr) {
    Sonda sonda = Sonda();
    sonda.posicao.parOrdenado.x = pX;
    sonda.posicao.parOrdenado.y = pY;

    EnumDirecao enumDirecao =
        ConversorEnumDirecao().toEnum(pDirecaoStr) as EnumDirecao;
    sonda.posicao.direcao.atribuir(enumDirecao);
    _sondas.add(sonda);

    return sonda;
  }

  Procedimento novoProcedimento(Sonda pSonda, List<Comando> pComandos) {
    Procedimento procedimento = Procedimento();
    procedimento.sonda = pSonda;
    procedimento.comandos = pComandos;
    _procedimentos.add(procedimento);

    return procedimento;
  }

  Sonda ultimaSonda() {
    return _sondas.last;
  }

  void executarProcedimentos() {
    for (var i = 0; i < _procedimentos.length; i++) {
      Procedimento procedimento = _procedimentos[i];

      for (var comando in procedimento.comandos) {
        EnumComando enumComando = comando.obterEnum() as EnumComando;
        Sonda sonda = procedimento.sonda;
        if (enumComando == EnumComando.comandoM) {
          try {
            _motorSonda.mover(sonda);
          } catch (e) {
            print(e);
          }
        } else {
          _motorSonda.girar(sonda, comando);
        }
      }
    }
  }

  void escreverPosicoesFinais() {
    for (var sonda in _sondas) {
      print(sonda.toString());
    }
  }

  List<String> obterPosicoesFinaisEmLista() {
    List<String> lista = [];
    for (var sonda in _sondas) {
      lista.add(sonda.toString());
    }
    return lista;
  }

  void pousarSondas() {
    for (var sonda in _sondas) {
      sonda.emTerra = Malha().parEstaNosLimites(sonda.posicao.parOrdenado);
    }
  }

  void limparSondas() {
    _sondas.clear();
  }
}
