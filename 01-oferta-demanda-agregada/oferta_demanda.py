# Importando bibliotecas necessárias
import pandas as pd
import matplotlib.pyplot as plt

# ==========================================
# 1. Dados a preços constantes (Reais)
df_constantes = pd.DataFrame({
    'Ano': [2022]*4 + [2023]*4 + [2024]*4,
    'Trimestre': ['1T', '2T', '3T', '4T']*3,
    'PIB Real': [305423.35, 313198.51, 323064.76, 315307.04, 318997.40, 325257.49,
                 330673.02, 322813.14, 327162.91, 336102.42, 344057.15, 334488.12],
    'Consumo Famílias': [202049.26, 207296.01, 214782.71, 222473.33, 210186.02, 213701.95,
                         221800.82, 228340.40, 220153.67, 224575.56, 234081.33, 236836.06],
    'Consumo Governo': [53623.8, 55885.83, 57074.43, 57451.81, 54429.05, 58590, 59084.03,
                        60383.13, 56679.83, 59276.94, 59830.78, 61109.86],
    'Investimento': [57038, 59158.76, 64101.51, 62222.39, 57865.26, 58243.38, 59715.33,
                     59472.35, 59611.51, 61583.72, 66174.85, 65073.86],
    'Exportações': [40512.59, 44910.1, 46199.32, 44988.77, 43389.84, 50066.33, 50643.8,
                    48268.32, 46027.22, 52235.9, 51718.77, 47940.59],
    'Importações': [40352.7, 42369.14, 47737.65, 45101.93, 41027.63, 42815.99, 44954.86,
                    44686.32, 45134.54, 49109.05, 52902.99, 51833.78]
})

# Cálculo do Deflator do PIB 
df_constantes['Deflator PIB'] = [759.45, 803.80, 805.16, 837.75, 809.10, 838.59,
                                 837.52, 887.60, 841.54, 869.15, 869.02, 920.92]

# Cálculo da Demanda Agregada Real
df_constantes['Demanda Agregada Real'] = (
    df_constantes['Consumo Famílias'] +
    df_constantes['Consumo Governo'] +
    df_constantes['Investimento'] +
    df_constantes['Exportações'] -
    df_constantes['Importações']
)

# Cálculo do PIB Potencial (Média Móvel de 4 trimestres)
df_constantes['PIB Potencial (Média Móvel)'] = df_constantes['PIB Real'].rolling(window=4, min_periods=1).mean()

# Definir períodos trimestrais
periodos = df_constantes['Ano'].astype(str) + " " + df_constantes['Trimestre']

# ==========================================
# Gráfico 1: PIB Real trimestral
plt.figure(figsize=(12, 6))
plt.plot(periodos, df_constantes['PIB Real'], marker='o', linewidth=2, color='navy')
plt.title('Evolução do PIB Real no Brasil (2022-2024)', fontsize=16)
plt.xlabel('Trimestres', fontsize=14)
plt.ylabel('PIB Real (Milhões de R$)', fontsize=14)
plt.xticks(rotation=45)
plt.grid(True, linestyle='--', alpha=0.7)
plt.tight_layout()
plt.show()

# ==========================================
# Gráfico 2: Deflator do PIB (Inflação)
plt.figure(figsize=(12, 6))
plt.plot(periodos, df_constantes['Deflator PIB'], marker='s', linewidth=2, color='darkred')
plt.title('Evolução do Deflator do PIB (Inflação trimestral) (2022-2024)', fontsize=16)
plt.xlabel('Trimestres', fontsize=14)
plt.ylabel('Deflator do PIB (Índice)', fontsize=14)
plt.xticks(rotation=45)
plt.grid(True, linestyle='--', alpha=0.7)
plt.tight_layout()
plt.show()

# ==========================================
# Gráfico 3: PIB Real vs PIB Potencial Aproximado
plt.figure(figsize=(12, 6))
plt.plot(periodos, df_constantes['PIB Real'], marker='o', linewidth=2, label='PIB Real', color='green')
plt.plot(periodos, df_constantes['PIB Potencial (Média Móvel)'], marker='s', linewidth=2,
         linestyle='--', label='PIB Potencial Aproximado', color='orange')
plt.title('Comparação PIB Real vs PIB Potencial Aproximado (2022-2024)', fontsize=16)
plt.xlabel('Trimestres', fontsize=14)
plt.ylabel('PIB Real (Milhões de R$)', fontsize=14)
plt.xticks(rotation=45)
plt.grid(True, linestyle='--', alpha=0.7)
plt.legend()
plt.tight_layout()
plt.show()

# ==========================================
# Gráfico da Demanda Agregada Real
plt.figure(figsize=(12, 6))
plt.plot(periodos, df_constantes['Demanda Agregada Real'], marker='^', linewidth=2, color='purple')
plt.title('Evolução da Demanda Agregada Real no Brasil (2022-2024)', fontsize=16)
plt.xlabel('Trimestres', fontsize=14)
plt.ylabel('Demanda Agregada Real (Milhões de R$)', fontsize=14)
plt.xticks(rotation=45)
plt.grid(True, linestyle='--', alpha=0.7)
plt.tight_layout()
plt.show()
