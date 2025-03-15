# Comando para instalação de alguns pacotes usados neste script.
# Após fazer a instalação deles, esse comando não é mais necessário e
# pode ser comentado ou removido do código.
install.packages(c("dplyr", "ggplot2", "httr", "readxl", "tidyr"))

library(dplyr)
library(ggplot2)
library(httr)
library(readxl)
library(tidyr)

obter_base_monetaria_excel = function(url) {
    # Criar um arquivo temporário do Excel
    arquivo_base_monetaria_excel = tempfile(fileext = ".xlsx")

    # Baixar o arquivo do Excel
    GET(url, write_disk(arquivo_base_monetaria_excel, overwrite = TRUE))

    # Leitura do arquivo Excel
    dados = read_excel(arquivo_base_monetaria_excel)

    # Remover tudo que esteja antes da linha 7 e depois da linha 296, pois nessas linhas não
    # contém os dados que queremos.
    dados = dados[8:296, ]

    # Renomear as colunas do dataframe
    colnames(dados) <- c("Data", "PMC_SF", "RB_SF", "BM_SF", "PMC_MEDIA", "RB_MEDIA", "BM_MEDIA")

    # Obter o número de linhas do dataframe
    num_linhas = nrow(dados)

    # Substituir a primeira coluna pelas datas corretas, começando de "2001-01-01" e
    # incrementando os meses. Isso é necessário porque quando o R lê as datas da planilha, ele as
    # converte para um formato incorreto. Então, é preciso fazer essa correção nas datas.
    dados$Data <- seq.Date(
        from=as.Date("2001-01-01"),
        by="month",
        length.out=num_linhas
    )

    # As colunas numéricas estão como strings. Elas precisam ser convertidas para números.
    dados[, 2:7] <- lapply(dados[, 2:7], function(x) as.numeric(x))

    return(dados)
}

obter_meio_pagamento_excel = function(url) {
    # Criar um arquivo temporário do Excel
    arquivo_meio_pagamento_excel = tempfile(fileext = ".xlsx")

    # Baixar o arquivo do Excel
    GET(url, write_disk(arquivo_meio_pagamento_excel, overwrite = TRUE))

    # Leitura do arquivo Excel
    dados = read_excel(arquivo_meio_pagamento_excel)

    # Remover tudo que esteja antes da linha 8 e depois da linha 285, pois nessas linhas não
    # contém os dados que queremos.
    dados = dados[8:285, ]

    # Renomear as colunas do dataframe
    colnames(dados) <- c("Data", "PMPP_SF", "DV_SF", "M1_SF", "PMPP_MEDIA", "DV_MEDIA", "M1_MEDIA")

    # Obter o número de linhas do dataframe
    num_linhas = nrow(dados)

    # Substituir a primeira coluna pelas datas corretas, começando de "2001-12-01" e
    # incrementando os meses. Isso é necessário porque quando o R lê as datas da planilha, ele as
    # converte para um formato incorreto. Então, é preciso fazer essa correção nas datas.
    dados$Data <- seq.Date(
        from=as.Date("2001-12-01"),
        by="month",
        length.out=num_linhas
    )

    # As colunas numéricas estão como strings. Elas precisam ser convertidas para números.
    dados[, 2:7] <- lapply(dados[, 2:7], function(x) as.numeric(x))

    return(dados)
}

# Link do Banco Central que contém uma planilha com informações da base monetária
base_monetaria_url = "https://www.bcb.gov.br/content/indeco/indicadoresselecionados/ies-05.xlsx"

# Dados de base monetária
base_monetaria_df = obter_base_monetaria_excel(base_monetaria_url)

# Link do Banco Central que contém uma planilha com informações do meio de pagamento M1
meio_pagamento_url = "https://www.bcb.gov.br/content/indeco/indicadoresselecionados/ies-09.xlsx"

# Dados de meio de pagamento
meio_pagamento_df = obter_meio_pagamento_excel(meio_pagamento_url)

# Combinar os dois dataframes em um único
multiplicador_df = merge(meio_pagamento_df, base_monetaria_df, by="Data")

# Calcular os coeficientes C, D, R1 e R2
multiplicador_df$C = multiplicador_df$PMPP_MEDIA / multiplicador_df$M1_MEDIA
multiplicador_df$D = multiplicador_df$DV_MEDIA / multiplicador_df$M1_MEDIA
multiplicador_df$R1 = (multiplicador_df$PMC_MEDIA - multiplicador_df$PMPP_MEDIA) / multiplicador_df$DV_MEDIA
multiplicador_df$R2 = multiplicador_df$RB_MEDIA / multiplicador_df$DV_MEDIA

# Calular o multiplicador monetário
multiplicador_df$K = 1 / (multiplicador_df$C + (multiplicador_df$D * (multiplicador_df$R1 + multiplicador_df$R2)))

# Calcular PMPP / DV, para também plotar no gráfico
multiplicador_df$PMPP_DV = multiplicador_df$PMPP_MEDIA / multiplicador_df$DV_MEDIA

# Gráfico do multiplicador monetário junto com alguns indicadores monetários
df_grafico = multiplicador_df %>%
    pivot_longer(cols=c(K, R1, R2, PMPP_DV), names_to="Variavel", values_to="Valor")

ggplot(df_grafico, aes(x=Data, y=Valor, color=Variavel)) +
    geom_line() +
    geom_hline(yintercept=1, linetype="dashed", color="black") +
    scale_x_date(date_breaks="2 years", date_labels="%Y") +
    scale_y_continuous(breaks=seq(0, max(df_grafico$Valor), by=0.2)) +
    labs(x="Ano", y="Razão", title="Indicadores monetários no Brasil entre Dez-2001 e Jan-2025") +
    theme_minimal() +
    theme(legend.title=element_blank(), plot.title=element_text(hjust=0.5))
