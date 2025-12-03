### Tradução completa do modelo semântico do Power BI

Scripts do Power BI e do Microsoft Fabric para traduzir modelo semântico "Contoso" do inglês para português (dados + estrutura)

Como utilizar:

Assista ao vídeo para entender as etapas do processo de tradução do modelo semântico:

#### Microsoft Fabric

1) Em um workspace que esteja dentro de uma capacidade do Microsoft Fabric, crie um lakehouse ou escolha um lakehouse existente;
2) Abra o arquivo do notebook **"NB_Contoso.ipynb"** que está neste repositório e associe o lakehouse ao notebook;
3) Dentro do script é necessário configurar os dados da chave e região da API do Azure Translator para traduzir os dados das colunas que estão em inglês para português. É permitido traduzir 2 milhões de caracteres grátis por mês. Mais informações no link: https://azure.microsoft.com/en-us/products/ai-foundry/tools/translator
4) Execute o script do notebook para criar as tabelas stg e silver com novas colunas traduzidas para português.
5) Acesse o SQL Endpoint do lakehouse e execute o script **"Criando views Contoso gold.sql"** que está neste repositório para criar as views para camada gold - que serão consumidas pelo Power BI.

#### Power BI

6) Abra o Power BI Desktop, vá em "Arquivo", "Opções e configurações", "Opções"e "Configurações regionais" e mude "Idioma do aplicativo" e "Idioma do modelo" para "Inglês (Estados Unidos)". Esta etapa é necessária para garantir que a cultura do modelo semântico seja gerada inicialmente em inglês.
7) Clique na opção "Catálogo do OneLake" para obter dados do lakehouse. Escolha na seta do botão "Conectar" a opção "Conectar ao ponto de extremidade SQL" que permite selecionar as views do lakehouse - gold_customer, gold_date, gold_sales, gold_store e gold_product (modo "import").
8) Importe as 5 views com o prefixo "gold_*" para o Power BI.
9) Copie o script **"Modelo completo.tmdl"** que está neste repositório e cole na aba "TMDL view" do Power BI Desktop.
10) No final do script TMDL, altere as propriedades "expression servidor" e copie o nome do servidor do seu lakehouse no Microsoft Fabric. Para localizá-lo, vá até o workspace do Microsoft Fabric, clique nas reticências ao lado do SQL Endpoint e escolha a opção "Copiar cadeia de conexão SQL". Cole o texto copiado no lugar onde está escrito "contoso_servidor".
11) No final do script TMDL, altere as propriedades "expression bancodedados" e digite o nome do banco de dados do seu lakehouse no Microsoft Fabric. Substitua onde está escrito "LH_Contoso".
12) Clique no botão "Apply" para criar todas as funcionalidades no modelo semântico (relacionamentos de tabelas, formatação de colunas, criação de medidas, criação de traduções e criação de perspectivas)
13) Clique em "Refresh now" para atualizar os dados. Faça sua conexão ao lakehouse pela conta Microsoft.
14) **Dica:** confira no arquivo **"Translations_pt-br.tmdl"** o código TMDL utilizado para criar as traduções e no arquivo **"Perspectives.tmdl"** o código TMDL para criar as perspectivas. Estes códigos podem servir como exemplo para criar novas traduções e perspectivas em outros projetos!
