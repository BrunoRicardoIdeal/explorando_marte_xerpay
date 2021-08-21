import 'package:explorando_marte_xerpay/class/motor.dart';
import 'package:explorando_marte_xerpay/common/constantes.dart';
import 'package:explorando_marte_xerpay/common/tipos.dart';
import 'package:explorando_marte_xerpay/model/comando.dart';
import 'package:explorando_marte_xerpay/model/direcao.dart';
import 'package:explorando_marte_xerpay/model/malha.dart';
import 'package:explorando_marte_xerpay/model/par_ordenado.dart';
import 'package:explorando_marte_xerpay/model/sonda.dart';

class MotorSonda implements Motor {
  @override
  void mover(pObj) {
    var sonda = pObj as Sonda;
    var enumDirecao = sonda.posicao.direcao.obterEnum();

    switch (enumDirecao) {
      case EnumDirecao.direcaoN:
        _moverSondaParaONorte(sonda);
        break;
      case EnumDirecao.direcaoS:
        _moverSondaParaOSul(sonda);
        break;
      case EnumDirecao.direcaoE:
        _moverSondaParaOLeste(sonda);
        break;
      case EnumDirecao.direcaoW:
        _moverSondaParaOOeste(sonda);
        break;
    }
  }

  @override
  void girar(pObj, Comando pComando) {
    EnumComando enumComando = pComando.obterEnum();
    Sonda sonda = pObj as Sonda;

    if (enumComando == EnumComando.comandoM) {
      throw Exception(Constantes.msgComandoGiroInvalido);
    }

    Direcao direcaoAtual = sonda.posicao.direcao;
    int indiceDirecao = direcaoAtual.obterEnum().index;

    int parcela = 0;
    if (enumComando == EnumComando.comandoR) {
      parcela = _obterParcelaGirarParaDireita(direcaoAtual);
    } else if (enumComando == EnumComando.comandoL) {
      parcela = _obterParcelaGirarParaEsquerda(direcaoAtual);
    }

    EnumDirecao enumDirecao = EnumDirecao.values[indiceDirecao + parcela];
    direcaoAtual.atribuir(enumDirecao);
    sonda.posicao.direcao = direcaoAtual;
  }

  ParOrdenado _obterParOrdenadoMovimentandoSondaVerticalmente(
      Sonda pSonda, bool pCima) {
    ParOrdenado parOrdenado = ParOrdenado();
    parOrdenado.clonar(pSonda.posicao.parOrdenado);
    if (pCima) {
      parOrdenado.y = parOrdenado.y + 1;
    } else {
      parOrdenado.y = parOrdenado.y - 1;
    }
    return parOrdenado;
  }

  ParOrdenado _obterParOrdenadoMovimentandoSondaHorizontalmente(
      Sonda pSonda, bool pDireita) {
    ParOrdenado parOrdenado = ParOrdenado();
    parOrdenado.clonar(pSonda.posicao.parOrdenado);
    if (pDireita) {
      parOrdenado.x = parOrdenado.x + 1;
    } else {
      parOrdenado.x = parOrdenado.x - 1;
    }
    return parOrdenado;
  }

  void _atribuirParOrdenadoSondaMovimentada(
      Sonda pSonda, ParOrdenado pParOrdenado) {
    if (Malha().parEstaNosLimites(pParOrdenado)) {
      pSonda.posicao.parOrdenado = pParOrdenado;
    } else {
      throw Exception(Constantes.msgErroMovimentoAbortado);
    }
  }

  void _moverSondaParaONorte(Sonda pSonda) {
    ParOrdenado parOrdenado =
        _obterParOrdenadoMovimentandoSondaVerticalmente(pSonda, true);

    _atribuirParOrdenadoSondaMovimentada(pSonda, parOrdenado);
  }

  void _moverSondaParaOSul(Sonda pSonda) {
    ParOrdenado parOrdenado =
        _obterParOrdenadoMovimentandoSondaVerticalmente(pSonda, false);

    _atribuirParOrdenadoSondaMovimentada(pSonda, parOrdenado);
  }

  void _moverSondaParaOLeste(Sonda pSonda) {
    ParOrdenado parOrdenado =
        _obterParOrdenadoMovimentandoSondaHorizontalmente(pSonda, true);

    _atribuirParOrdenadoSondaMovimentada(pSonda, parOrdenado);
  }

  void _moverSondaParaOOeste(Sonda pSonda) {
    ParOrdenado parOrdenado =
        _obterParOrdenadoMovimentandoSondaHorizontalmente(pSonda, false);

    _atribuirParOrdenadoSondaMovimentada(pSonda, parOrdenado);
  }

  int _obterParcelaGirarParaDireita(Direcao pDirecao) {
    if (pDirecao.obterEnum() == EnumDirecao.direcaoW) {
      return -3;
    }

    return 1;
  }

  int _obterParcelaGirarParaEsquerda(Direcao pDirecao) {
    if (pDirecao.obterEnum() == EnumDirecao.direcaoN) {
      return 3;
    }

    return -1;
  }
}
