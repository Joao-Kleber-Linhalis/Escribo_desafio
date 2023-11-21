# Escribo_desafio

Este é um aplicativo Flutter simples que realiza a soma de todos os valores inteiros divisíveis por 3 ou 5, inferiores a um número fornecido.

## Como Executar

Certifique-se de ter o Flutter instalado no seu ambiente de desenvolvimento.

1. Clone o repositório para a sua máquina local:
2. Execute pela IDE de sua preferencia (VSCode , Android Studio).
3. Escolha o desafio , caso seja o 2, click no botão para permitir a leitura e gravação de arquivos.

## Desafio 1 de forma simples

1. Abra https://dartpad.dev/?
2. Coloque o seguinte código :

<pre>
<code>
void main() {
  print(Soma(13)); // Número que desejar.
}

int Soma(int numero) {
  int total = 0;
  for (int i = 0; i < numero; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      total += i;
    }
  }
  return total;
}
</code>
</pre>

É a mesma lógica do app para a IDE mas para ser executado no dartpad sem a necessidade da IDE.

## Desafio 2

1. Execute o código com as orientações ditas no começo desse arquivo ou instale o APK disponibilizado na pasta APK Versão Final.
2. Selecione o Desafio 2.
3. Permita a leitura e gravação de arquivos no dispositivo.
4. Ao clickar no Icon semelhante a um marcador de texto, o livro será favoritado e assim podendo ser filtrado pelos botões presentes na AppBar de Livros ou Favoritos.
5. Ao clickar na capa do livro, o mesmo será baixado dentro da pasta Documents do dispositivo com o padrão "nomeLivro.epub".
6. Após concluir o download ou caso o arquivo já esteja presente no dispositivo, usará a API Vocsy Epub Viewer para abrir o livro selecionado.
