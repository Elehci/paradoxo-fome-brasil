
-- ====================================================================
-- SCRIPT 2: Cria e popula a tabela de produção agrícola
-- ====================================================================
-- Lê os dados brutos da tabela 'bruto_ibge_lavouras', converte os
-- tipos de dados de forma segura e insere na tabela final
-- 'ft_producao_agricola_anual'.
-- ====================================================================

CREATE OR REPLACE TABLE `t1engenhariadados.paradoxo_fome_br.ft_producao_agricola_anual`
PARTITION BY data_particao AS
SELECT
  SAFE_CAST(ano AS INT64) AS ano,
  produto AS nm_produto,
  SAFE_CAST(producao_toneladas AS NUMERIC) AS qtd_producao_toneladas,
  SAFE_CAST(area_colhida_hectares AS NUMERIC) AS qtd_area_colhida_ha,
  SAFE_DIVIDE(SAFE_CAST(producao_toneladas AS NUMERIC), SAFE_CAST(area_colhida_hectares AS NUMERIC)) AS vlr_rendimento_medio_ha,
  DATE(SAFE_CAST(ano AS INT64), 1, 1) AS data_particao
FROM
  `t1engenhariadados.paradoxo_fome_br.bruto_ibge_lavouras`
WHERE
  SAFE_CAST(ano AS INT64) IS NOT NULL;
  