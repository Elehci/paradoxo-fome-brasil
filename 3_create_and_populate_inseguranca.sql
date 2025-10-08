3_create_and_populate_inseguranca.sql

-- ====================================================================
-- SCRIPT 3: Cria e popula a tabela de insegurança alimentar
-- ====================================================================
-- Lê os dados das tabelas brutas de fome e cesta básica, une as
-- informações e insere na tabela final 'ft_inseguranca_alimentar_anual'.
-- Esta versão força a conversão para STRING para evitar erros de tipo.
-- ====================================================================

CREATE OR REPLACE TABLE `t1engenhariadados.paradoxo_fome_br.ft_inseguranca_alimentar_anual`
PARTITION BY data_particao AS
SELECT
  SAFE_CAST(ia.ano AS INT64) AS ano,
  SAFE_CAST(REPLACE(CAST(ia.percentual_ia_grave AS STRING), ',', '.') AS FLOAT64) AS pct_inseguranca_alimentar,
  CAST(SAFE_CAST(REPLACE(CAST(ia.populacao_ia_grave_milhoes AS STRING), ',', '.') AS FLOAT64) * 1000000 AS INT64) AS qtd_populacao_ia,
  SAFE_CAST(REPLACE(CAST(cesta.valor_medio_anual_cesta AS STRING), ',', '.') AS FLOAT64) AS vlr_cesta_basica_anual,
  NULL AS pct_variacao_cesta_basica,
  DATE(SAFE_CAST(ia.ano AS INT64), 1, 1) AS data_particao
FROM
  `t1engenhariadados.paradoxo_fome_br.bruto_pnad_ia` AS ia
LEFT JOIN
  `t1engenhariadados.paradoxo_fome_br.bruto_dieese_cesta` AS cesta
ON
  SAFE_CAST(ia.ano AS INT64) = SAFE_CAST(cesta.ano AS INT64)
WHERE
  SAFE_CAST(ia.ano AS INT64) IS NOT NULL;
