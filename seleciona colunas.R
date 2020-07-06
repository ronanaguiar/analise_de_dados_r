## Carregando libraries ##
library(dplyr) # manipulação dos dados



selecionar_colunas <- function(dados, nome_coluna, ...){

                      dados_selecionados <- dados %>%
                                            select(nome_coluna, ...)
                      dados_selecionados$cod_setor <- as.character(dados_selecionados$cod_setor)
                      
                                            
                      
                      
                                            
return(write.csv2(dados_selecionados,"~/Documentos/qgis/dados_selecionados.csv", fileEncoding = codificacao$encoding[1] ))
}

caminho_do_arquivo = "~/Documentos/qgis/ES_20171016/Base informaçoes setores2010 universo ES/CSV/Basico_ES.csv"

codificacao = readr::guess_encoding(caminho_do_arquivo)

dados <- read.csv2(caminho_do_arquivo, fileEncoding= (codificacao$encoding[1]))

dados <- janitor::clean_names(dados)

selecionar_colunas(dados, 'cod_setor','nome_do_bairro', 'tipo_setor', 'nome_do_municipio', 'v001', 'v002', 'v003')

arquivo_csv <- read.csv2('~/Documentos/qgis/dados_selecionados.csv', fileEncoding= (codificacao$encoding[1]))

