### Tradução completa do modelo semântico do Power BI

Scripts do Power BI e do Microsoft Fabric para traduzir modelo semântico "Contoso" do inglês para português (dados + estrutura)

#### Como utilizar:

Assista ao vídeo para entender as etapas do processo de tradução do modelo semântico:

#### Microsoft Fabric

1) Em um workspace que esteja dentro de uma capacidade do Microsoft Fabric, crie um lakehouse ou escolha um lakehouse existente;
2) Abra o arquivo do notebook **"NB_Contoso.ipynb"** que está neste repositório e associe o lakehouse ao notebook;
3) Dentro do script é necessário configurar os dados da chave e região da API do Azure Translator para traduzir os dados das colunas que estão em inglês para português. É permitido traduzir 2 milhões de caracteres grátis por mês. Mais informações no link: https://azure.microsoft.com/en-us/products/ai-foundry/tools/translator
4) Execute o script do notebook para criar as tabelas stg e silver com novas colunas traduzidas para português.
5) Acesse o SQL Endpoint do lakehouse e execute o script **"Criando views Contoso gold.sql"** que está neste repositório para criar as views para camada gold - que serão consumidas pelo Power BI.

#### Power BI

6) Abra o Power BI Desktop, vá em "Arquivo", "Opções e configurações", "Opções"e "Configurações regionais" e mude "Idioma do aplicativo" e "Idioma do modelo" para "Inglês (Estados Unidos)". Esta etapa é necessária para garantir que a cultura do modelo semântico seja gerada inicialmente em inglês.
7) Copie o script **"Modelo completo.tmdl"** que está neste repositório e cole na aba "TMDL view" do Power BI Desktop.
8) No final do script TMDL, altere as propriedades "expression servidor" e copie o nome do servidor do seu lakehouse no Microsoft Fabric. Para localizá-lo, vá até o workspace do Microsoft Fabric, clique nas reticências ao lado do SQL Endpoint e escolha a opção "Copiar cadeia de conexão SQL". Cole o texto copiado no lugar onde está escrito "contoso_servidor".
9) No final do script TMDL, altere as propriedades "expression bancodedados" e digite o nome do banco de dados do seu lakehouse no Microsoft Fabric. Substitua onde está escrito "LH_Contoso".
10) Clique no botão "Apply" para criar todas as funcionalidades no modelo semântico (relacionamentos de tabelas, formatação de colunas, criação de medidas, criação de traduções e criação de perspectivas)
11) Clique em "Refresh now" para atualizar os dados. Faça sua conexão ao lakehouse pela conta Microsoft.
12) Publique o arquivo do Power BI Desktop no workspace do Microsoft Fabric.
13) **Dica:** confira no arquivo **"Translations_pt-br.tmdl"** o código TMDL utilizado para criar as traduções e no arquivo **"Perspectives.tmdl"** o código TMDL para criar as perspectivas. Estes códigos podem servir como exemplo para criar novas traduções e perspectivas em outros projetos!

**Obs:** o script **"Modelo completo.tmdl"** somente funcionará corretamente seguindo todas as etapas deste tutorial (com as novas colunas em português criadas no lakehouse do Microsoft Fabric). É possível utilizar outras alternativas (criar as colunas no Power Query, por exemplo). Caso você queira usar o arquivo "Contoso" original, você pode obtê-lo neste link:  https://www.microsoft.com/en-us/download/details.aspx?id=46801

#### Como testar a tradução do modelo semântico "Contoso" para português (recursos translations e perspectives):

##### Power BI Desktop

13.1) Abra o Power BI Desktop, vá em "Arquivo", "Opções e configurações", "Opções"e "Configurações regionais" e mude "Idioma do aplicativo" e "Idioma do modelo" para "Português (Brasil)".<br>
13.2) No Power BI Desktop, clique em "Obter Dados", "Analysis Services".<br>
13.3) Na opção "Servidor", cole o nome do servidor do workspace que está em uma capacidade do Microsoft Fabric (pode ser obtido em "Configurações do workspace', "Informações da licença", "Link de conexão"). Mantenha marcada a opção "Conectar em tempo real"<br>
13.4) Selecione o seu modelo semântico publicado na etapa 12, expanda a seta do lado esquerdo e escolha a perspectiva "Contoso PT-BR" para se conectar ao modelo que possui somente as colunas em português ou traduzidas para português.<br>
13.5) Confira se os nomes das colunas e das métricas estão em português, e se os dados das colunas traduzidas estão em português conforme imagem a seguir:<br><br>



<img width="215" height="588" alt="image" src="https://github.com/user-attachments/assets/c059ce11-d2d9-438e-9f9f-b17e557ae23f" /><br><br>



##### Excel

14.1) Abra o Excel, vá em 'Arquivo", "Opções", "Idioma" e garanta que as propriedades estejam marcadas para "Português".<br>
14.2) No Excel clique no menu "Dados", "Obter Dados", "Do Banco de Dados", "Analysis Services".<br>
14.3) Na opção "Servidor", cole o nome do servidor do workspace que está em uma capacidade do Microsoft Fabric (pode ser obtido em "Configurações do workspace', "Informações da licença", "Link de conexão").<br>
14.4) Selecione o seu modelo semântico publicado na etapa 12, mantenha marcada a opção "Conectar a um cubo ou tabela específica" e escolha a perspectiva "Contoso PT-BR" para se conectar ao modelo que possui somente as colunas em português ou traduzidas para português.<br>
14.5) Clique em "Concluir" para que seja gerada uma tabela dinâmica conectada à perspectiva.<br><br>

<img width="422" height="440" alt="image" src="https://github.com/user-attachments/assets/36ef292d-66df-4a40-85f1-5db409372c39" /><br><br>


##### Power BI serviço

Nos testes realizados o recurso de tradução funcionou corretamente porém as perspectivas não foram aplicadas.

Mais informações sobre o funcionamento das perspectivas no Power BI você pode encontrar neste link: https://www.datazoe.blog/post/perspectives-in-power-bi-semantic-models
