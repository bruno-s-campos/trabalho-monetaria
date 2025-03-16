# 📊 Análise da Oferta e Demanda Agregada no Brasil

Este diretório contém um **script em Python** para analisar a **oferta e demanda agregada no Brasil** entre os anos de **2022 e 2024**. O script gera gráficos que ilustram a evolução do **PIB Real**, **Deflator do PIB**, **PIB Real vs PIB Potencial** e **Demanda Agregada Real**.

## 📋 Requisitos

- Python (versão 3.8 ou superior)
- Editor de código como VS Code, PyCharm ou Jupyter Notebook.

### 📦 Pacotes necessários

O script utiliza as seguintes bibliotecas:

- `pandas`
- `matplotlib`

## 🔧 Instalação

1. **Instalar o Python**: caso não o tenha instalado, siga a [documentação oficial](https://www.python.org/downloads/) para instalá-lo no seu sistema operacional.

2. **Criar um ambiente virtual (opcional, mas recomendado)**:  
   Para evitar conflitos entre pacotes, crie um ambiente virtual e ative-o.

   No **Windows**:
   ```bash
   python -m venv venv
   venv\Scripts\activate
   ```

   No **MacOS/Linus**:
   ```
   python -m venv venv
   source venv/bin/activate
   ```

3. **Instalar os pacotes necessários**: no terminal, execute o seguinte comando: 
   ```
   pip install pandas matplotlib
   ```

## ▶️Executando o programa

Para rodar o código, basta instalar os pacotes necessários e executá-lo no Jupyter Notebook ou diretamente no terminal.

No **Jupyter Notebook**:

1. Abra o Jupyter Notebook executando o seguinte comando no terminal:
   ```
   jupyter notebook
   ```

2. No Jupyter, navegue até o diretório onde está o arquivo `oferta_demanda.py`

3. Em uma nova célula do notebook, execute o seguinte comando:
   ```
   %run oferta_demanda.py
   ```

No **Terminal**:

1. Abra o terminal no diretório onde o arquivo `oferta_demanda. py` se encontra. Em seguida, execute o comando:
   ```
   python oferta_demanda.py
   ```

## 📊 Saída Esperada

O programa deve gerar automaticamente os seguintes gráficos:

1. **Evolução do PIB Real (2022-2024):**
Um gráfico mostrando a variação do PIB Real ao longo do período analisado.

2. **Evolução do Deflator do PIB (Inflação trimestral):**
Um gráfico que ilustra a inflação trimestral medida pelo deflator do PIB.

3. **Comparação entre PIB Real e PIB Potencial:**
Um gráfico comparativo entre o PIB Real e o PIB Potencial, destacando possíveis gaps.

4. **Evolução da Demanda Agregada Real:**
Um gráfico que mostra a evolução da demanda agregada ao longo do tempo.

## 📊 📁 Estrutura do Projeto

- `README.md`: Este arquivo, contendo as instruções de uso.

- `oferta_demanda.py`: O script Python principal para análise e geração dos gráficos.
