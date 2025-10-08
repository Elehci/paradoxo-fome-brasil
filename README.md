# Análise de Dados: O Paradoxo da Fome no Brasil

 #  📖 Sobre o Projeto

Este projeto é uma análise de dados completa sobre o paradoxo da insegurança alimentar no Brasil, um país que é uma potência agrícola Nome ainda enfrenta o desafio da fome. O objetivo foi utilizar dados públicos para entender as causas estruturais do problema, focando no acesso e não na produção.

Este foi o projeto final para o curso de Análise de Dados Engenharia de Dados



---

 #  🚀 Tecnologias Utilizadas

*    Armazenamento e Processamento:  Google BigQuery
*    Transformação de Dados:  SQL
*    Visualização de Dados:  Looker Studio
*    Fontes de Dados:  IBGE (SIDRA), DIEESE, PNAD

---

 #  📈 Descobertas Principais

1.   Produção Desconectada do Consumo:  A produção agrícola recorde é impulsionada por commodities para exportação (soja, milho), enquanto a produção de alimentos básicos para o consumo interno (arroz, feijão) está estagnada.
2.   Acesso é o Vetor do Problema:  A análise de correlação mostrou que a fome está mais ligada à inflação dos alimentos e à queda na renda do que à disponibilidade de alimentos.
3.   Correlação Negativa com a Renda:  O gráfico de dispersão mostrou uma forte correlação negativa (-0.97) entre a renda per capita e os índices de insegurança alimentar.

---

 #  ⚙️ Como Recriar o Projeto

1.   Dados Brutos:  Os dados de origem estão na pasta `/data`.
2.   Pipeline no BigQuery: 
    *   Faça o upload dos arquivos CSV para um dataset no BigQuery.
    *   Execute os scripts na pasta `/sql` na ordem numérica para criar as tabelas finais.
3.   Visualização:  Conecte o Looker Studio às tabelas de fato (`ft_producao_agricola_anual` e `ft_inseguranca_alimentar_anual`) para recriar os gráficos.

---

 #  👨‍💻 Autor

Michele e Laynna


