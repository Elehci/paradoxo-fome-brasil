-- ====================================================================
-- SCRIPT 1: Cria a tabela de dimensão de tempo (dim_tempo)
-- ====================================================================
-- Este script cria uma tabela com uma lista de anos, décadas e
-- se o ano é bissexto. É útil para futuras análises temporais.
-- ====================================================================

CREATE OR REPLACE TABLE `t1engenhariadados.paradoxo_fome_br.dim_tempo`
(
  ano INT64,
  decada STRING,
  ano_bissexto BOOL
) AS
SELECT
  ano,
  CAST(FLOOR(ano / 10) * 10 AS STRING) AS decada,
  ( (MOD(ano, 4) = 0 AND MOD(ano, 100) != 0) OR MOD(ano, 400) = 0 ) AS ano_bissexto
FROM
  UNNEST(GENERATE_ARRAY(2000, 2030)) AS ano;
  