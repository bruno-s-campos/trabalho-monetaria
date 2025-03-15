# Questão 02 - Script em R para calcular o multiplicador monetário do Brasil

Este diretório contém um script em R para calcular o multiplicador monetário do Brasil entre Dezembro de 2001 e Janeiro de 2025.

## Requisitos

- R (versão 3.6.0 ou superior)
- R Studio Desktop
- Pacotes do R: "dplyr", "ggplot2", "httr", "readxl", "tidyr"

## Instalação

1. **Instalar o R**: caso não o tenha instalado, por favor seguir a [documentação oficial](https://cran.rstudio.com/) para instalá-lo em seu sistema operacional.

2. **Instalar o R Studio Desktop**: para instalar o R Studio, por favor seguir também a [documentação oficial do programa](https://posit.co/download/rstudio-desktop/).

3. **Instalar os pacotes do R**: abra o R Studio e execute o seguinte comando para instalar os pacotes necessários para a execução do programa.
```
install.packages(c("dplyr", "ggplot2", "httr", "readxl", "tidyr"))
```

Outra forma de instalar os pacotes no R Studio é clicando na aba "Tools" e "Install Packages". Na janela que abrir, escrever o nome dos pacotes e clicar em "Install".

## Execução do programa

Para executar o programa no R Studio, primeiro abra o arquivo `multiplicador-monetario.r` no R Studio. Em seguida, selecione todo o código. Por fim, execute as linhas selecionadas clicando no botão "Run" ou pressionando Ctrl-Enter.

O programa deve automaticamente fazer o download das bases de dados do site do Banco Central, fazer o cálculo do multiplicador monetário e gerar um gráfico com os resultados.
