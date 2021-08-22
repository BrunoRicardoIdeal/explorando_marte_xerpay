<h1 align="center">explorando_marte_xerpay</h1>

## Descrição do Projeto
<p align="center">Um breve programa para posicionar uma sonda a ser pousada em um planalto marciano. 🚀 </p>

## Regras
<p align="left">🔹 A posição e direção de uma sonda são representadas por uma combinação de coordenadas x-y e uma letra representando a direção cardinal para qual a sonda aponta, seguindo a rosa dos ventos em inglês.</p>
<p align="left">🔹 O planalto é dividido numa malha para simplificar a navegação. Um exemplo de posição seria (0, 0, N), que indica que a sonda está no canto inferior esquerdo e apontando para o Norte.</p>
<p align="left">🔹 Para controlar as sondas, a NASA envia uma simples sequência de letras. As letras possíveis são "L", "R" e "M". Destas, "L" e "R" fazem a sonda virar 90 graus para a esquerda ou direita, respectivamente, sem mover a sonda. "M" faz com que a sonda mova-se para a frente um ponto da malha, mantendo a mesma direção.</p>
<p align="left">🔹 Nesta malha o ponto ao norte de (x,y) é sempre (x, y+1).</p>
<p align="left">🔹 Entradas: limite superior da malha, sondas com posição incial e instruções</p>
<p align="left">🔹 Saídas: posições finais de cada sonda</p>

## Exemplo
<h4 align="left">Entradas</h4>

- 5 5
- 1 2 N
- LMLMLMLMM
- 3 3 E
- MMRMMRMRRM

<h4 align="left">Saídas</h4>

- 1 3 N
- 5 1 E

## Status

<h4 align="center"> 
	✔️ Sondas já preparadas para pousar em solo marciano 👽

	(mais novidades em breve...)
</h4>

### Features

- [x] Leitura de arquivo de entrada
- [x] Construção dos modelos abstratos
- [x] Criação das sondas e seus comandos
- [x] Proteção contra falhas