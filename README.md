# Escribo_desafio

Este é um aplicativo Flutter simples que realiza a soma de todos os valores inteiros divisíveis por 3 ou 5, inferiores a um número fornecido.

## Como Executar

Certifique-se de ter o Flutter instalado no seu ambiente de desenvolvimento.

1. Clone o repositório para a sua máquina local:
2. Execute pela IDE de sua preferencia (VSCode , Android Studio).
3. Insira o número e click no botão, a resposta aparecerá abaixo do campo de entrada.

## Caso queira de uma forma mais simples e sem ter que instalar o Flutter

1. Abra https://dartpad.dev/?
2. Coloque o seguinte código :
    void main() {
  print(Soma(13)); //Numero que desejar.
}

int Soma(int numero) {
  int total = 0;
  for (int i = 0; i < numero; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      total += i;
    }
  }
  return total;
}//Fim do código

É a mesma lógica do app para a IDE mas para ser executado no dartpad sem a necessidade da IDE.
