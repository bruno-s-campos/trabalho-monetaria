# Carregar pacotes necessários
library(ggplot2)
library(dplyr)

# Carregar os dados do arquivo CSV
dados = read.csv("dados.csv", header=TRUE, sep=";", stringsAsFactors=FALSE)

# Converter a coluna Data para formato de data (considerando mês/ano)
dados$Data = as.Date(paste0("01-", dados$Data), format="%d-%b/%y")

# Converter colunas numéricas
dados$BV = as.numeric(dados$BV)
dados$BM = as.numeric(dados$BM)
dados$Juros = as.numeric(dados$Juros) * 100

# Plotar gráfico da taxa de juros
ggplot(dados, aes(x=Data, y=Juros)) +
    geom_line(color="blue", linewidth=1) +
    geom_point(color="blue") +
    labs(x="Período",
        y="Taxa de Juros (%)") +
    theme_minimal()

# Plotar gráfico da base monetária
ggplot(dados, aes(x=Data, y=BM)) +
    geom_line(color="red", linewidth=1) +
    geom_point(color="red") +
    labs(x="Período",
        y="Base Monetária") +
    theme_minimal()

# Plotar gráfico da Bolsa de Valores
ggplot(dados, aes(x=Data, y=BV)) +
    geom_line(color="green", size=1) +
    geom_point(color="green") +
    labs(
        x="Período",
        y="Bolsa de Valores") +
    theme_minimal()

# Desativar notação científica
options(scipen=999)

# Regressão linear entre Bolsa de Valores (Y) e Base Monetária (X)
modelo1 = lm(BV ~ BM, data=dados)
summary(modelo1)

# Regressão linear entre Bolsa de Valores (Y), Base Monetária (X1) e Juros (X2)
modelo2 = lm(BV ~ BM + Juros, data=dados)
summary(modelo2)
