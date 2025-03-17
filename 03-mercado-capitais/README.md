# Questão 03 - Script em R para analisar o impacto da política monetária no mercado de capitais

Este diretório contém um script em R para analisar o impacto da política monetária no mercado de capitais, em especial durante o período da pandemia de Covid-19.

## Requisitos

- R (versão 3.6.0 ou superior)
- R Studio Desktop
- Pacotes do R: "dplyr", "ggplot2"

## Instalação

1. **Instalar o R**: caso não o tenha instalado, por favor seguir a [documentação oficial](https://cran.rstudio.com/) para instalá-lo em seu sistema operacional.

2. **Instalar o R Studio Desktop**: para instalar o R Studio, por favor seguir também a [documentação oficial do programa](https://posit.co/download/rstudio-desktop/).

3. **Instalar os pacotes do R**: abra o R Studio e execute o seguinte comando para instalar os pacotes necessários para a execução do programa.
```
install.packages(c("dplyr", "ggplot2"))
```

Outra forma de instalar os pacotes no R Studio é clicando na aba "Tools" e "Install Packages". Na janela que abrir, escrever o nome dos pacotes e clicar em "Install".

## Execução do programa

Para executar o programa no R Studio, primeiro abra o arquivo `mercado-capitais.r` no R Studio. Em seguida, selecione todo o código. Por fim, execute as linhas selecionadas clicando no botão "Run" ou pressionando Ctrl-Enter.

O programa utiliza a base de dados salva no arquivo `dados.csv`. Essa base foi criada tendo como base os valores disponibilizados no site do Banco Central.
