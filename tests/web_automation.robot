*** Settings***
Documentation       Aqui estarão todos os cenários de testes WEB


### Chama o arquivo que contém nossas regras
Resource        ../resources/Resource.robot

### Regras para ações
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Case ***
Caso de teste 01: Pesquisar produto existente
    [Tags]      Teste01
    acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo Pesquisar    
    Clicar no botão Pesquisar    
    Conferir se o produto "Blouse" foi listado no site


Caso de Teste 02: Pesquisar produto não existente
    [Tags]      Teste02
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Camisetaazul" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""


Caso de Teste 03: Listar Produtos
    [Tags]      Teste03
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página


Caso de Teste 04: Adicionar Cliente
    [Tags]      Teste04
### Adicionado dois passos para copiar um e-mail válido
    Acessar a pagina geradora de e-mail temporários
    Copiar o endereço de e-mail
### Inicio das atividade do professor
    Acessar a página home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso

Caso de teste de 01 a 04: Efetuar teste Completo
    [Tags]      Completo
    
### Adicionado dois passos para copiar um e-mail válido
    Acessar a pagina geradora de e-mail temporários
    Copiar o endereço de e-mail
    
### Inicio das atividade do professor
    acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo Pesquisar    
    Clicar no botão Pesquisar    
    Conferir se o produto "Blouse" foi listado no site
    Digitar o nome do produto "Camisetaazul" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso

Caso de teste 05: Copiando um email validação
    # [Tags]      Copiar
    #Acessar a pagina geradora de e-mail temporários
    #Copiar o endereço de e-mail
    #Armazenar o e-mail para a aplicação em execução 

