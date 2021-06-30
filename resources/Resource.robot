###########################################################################################################
###                                                                                                     ###
###                                 Desenvolvido por Marcelo Ng                                         ###
###                                                                                                     ###
### Atividade passada por Helder Fernandes no curso da Prime Experts, turma 4 (21/06/2021 à 02/07/2021) ###
###                                                                                                     ###
###########################################################################################################

*** Settings ***
Documentation       Responsável por armazenar todas as nossa Keyword e Variáveis de nosso Projeto de automação WEB.

Library     SeleniumLibrary
Library     String
###Library     WebElement

*** Variable ***
### Chamada do Navegador a ser utilizado
${BROWSER}      chrome
### URL que será utilizada
${URL}          http://automationpractice.com
${URL2}         https://10minutemail.net

### Dados para preenchimento do formulário do Teste 4
#${EMAIL}        wfs476w62s1@zwoho.com
### Preenchendo os campos obrigatórios para dados Pessoais (*)
${NOME}         Prime
${SOBRENOME}    Expert
${PASSWD}       prime
### Preenchendo os campos obrigatórios para dados de Endereço (*)
${ADRESS}       Rua 1
${CITY}         SP
###${STATE}        Georgia
${POSTCODE}     01234
${PHONE}        12345678912
${ALIAS}        Shopping


*** Keywords ***
### Setup e Teardown

### Exercicio 1
###Caso de teste 01: Pesquisar produto existente
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    
Fechar navegador
    Close Browser    

Acessar a pagina geradora de e-mail temporários
    Go To       ${URL2}

Copiar o endereço de e-mail
    Click Element       xpath=//*[@id="copy-button"]

acessar a página home do site Automation Practice
### Abrir a URL desejada
    Go To       ${URL}
### Verifica se o elemento que estamos aguardando está na tela, nesse caso a Barra de Menu. 
    Wait Until Element Is Visible       xpath=//*[@id='block_top_menu']/ul
### Verifica se o elemento que estamos aguardando está na tela, nesse caso o Título do Site.
    Title Should Be                     My Store

Digitar o nome do produto "${PRODUTO}" no campo Pesquisar
### Inserir o produto que deseja buscar no campo pesquisa 
    Input Text      name=search_query       ${PRODUTO}

Clicar no botão Pesquisar
###Clicar no botão pesquisar    
    Click Element       name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
### Verifica se o elemento que estamos aguardando está na tela, nesse caso o Título do Site.
    Title Should Be     Search - My Store
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]/h1/span[1]
    ### Verifica se o elemento que estamos aguardando está na tela, nesse caso a imagem da pesquisa.
    ###Page Should Contain Image      xpath=//*[@src="${URL}/img/p/7/7-home_default.jpg"]
    ##Page Should Contain Image      Xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
    #Mouse Over       xpath=//*[@id="center_column"]/ul/li
    #Page Should Contain Image      xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]
### Apenas Imprimindo a categoria que estamos, para validação.        
    Log To Console                 Exercío 01 Passou com sucesso!    
    Log To Console                 Foi possível visualizar o produto: ${PRODUTO}
    Sleep   2

### Exercício 2
##Caso de Teste 02: Pesquisar produto não existente
###Acessar a página home do site Automation Practice
###    Go To       ${URL}
###    Wait Until Element Is Visible       xpath=//*[@id='block_top_menu']/ul
###    Title Should Be                     My Store
Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
### Inserir o produto que deseja buscar no campo pesquisa
   Input Text      name=search_query       ${PRODUTO}

###Clicar no botão pesquisar
    ###   Click Element       name=submit_search

Conferir mensagem "No results were found for your search "${PRODUTO}""
### Verifica se o elemento que estamos aguardando está na tela, nesse caso o Título do Site. 
    Title Should Be     Search - My Store
    ### Verifica se o elemento que estamos aguardando está na tela.    
    Wait Until Element Is Visible       xpath=//*[@class="alert alert-warning"]
    ###Page Should Contain Image      xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]
    ###Page Should Contain Image      xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]
### Apenas Imprimindo a categoria que estamos, para validação.      
    Log To Console                 Exercío 02 Passou com sucesso!    
    Log To Console                 Não foi possível visualizar o produto: ${PRODUTO}
    Sleep   2



### Exercício 3
###Caso de Teste 03: Listar Produtos
Acessar a página home do site
### Acessa a URL pré-definida no início do projeto
    Go To       ${URL}
### Verifica se o elemento que estamos aguardando está na tela.    
    Wait Until Element Is Visible       xpath=//*[@id='block_top_menu']/ul
### Verifica se o elemento que estamos aguardando está na tela, nesse caso o Título do Site.    
    Title Should Be                     My Store

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
### Verifica se o elemento que estamos aguardando está na tela.
    ###Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul/li[1]/a

### Comando utilizado para movimentar o mouse até o local indicado e parar (utilizando XPATH), ativando assim o foco do menu.
    Mouse Over     xpath=//*[@id="block_top_menu"]/ul/li[1]/a

### Comando utilizado para movimentar o mouse até o local indicado e parar (utilizando um nome válido), ativando assim o foco do menu.
### Ainda não está funcionando corretamente.
    ###Mouse Over          ${CATEGORIA}
    
### Apenas caminho encontrado no XPATH para efetuar o link;
    ###xpath=//*[@id="block_top_menu"]/ul/li[1]/a


Clicar na sub categoria "${SUBCATEGORIA}"
### Maneira "porca"
    ###Go To       http://automationpractice.com/index.php?id_category=3&controller=category
       ###Go To       http://automationpractice.com/index.php?id_category=8&controller=category
            ###Go To       http://automationpractice.com/index.php?id_category=11&controller=category

### Maneira correta
### Comando utilizado para clicar no link da sub-categoria
    Click Element     xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
    ###Click Element       ${SUBCATEGORIA}
    Sleep       2

Conferir se os produtos da sub-categoria "${SUBCATEGORIA}" foram mostrados na página
###    [Arguments]         ${NOME}
### Faz a validação da pagina correta.
###    IF          '${SUBCATEGORIA}'=='Azul'
### Verifica se o elemento que estamos aguardando está na tela, nesse caso o Título do Site.  
        Title Should Be     Summer Dresses - My Store
### Verifica se o elemento que estamos aguardando está na tela, nesse caso verifica o nome da categoria que entrou.    
        Wait Until Element Is Visible      xpath=//*[@class="category-name"]
### Verifica se o elemento que estamos aguardando está na tela, nesse caso uma foto dentro do quadro de produtos.    
        Page Should Contain Image      xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/1/2/12-home_default.jpg"]
### Apenas Imprimindo a categoria que estamos, para validação.        
        Log To Console                 Exercío 03 Passou com sucesso!    
        Log To Console                 Você está na categoria segura de: ${SUBCATEGORIA}

###    ELSE If     ${SUBCATEGORIA}=='xpath=//*[@class="category-name"]'
        
###       Log To Console          Você está na categoria: ${SUBCATEGORIA}
###    END     
### Apenas caminho encontrado no XPATH para efetuar o link;
    ###'xpath=//*[@class="category-name"]'

### Exercício 4
###Caso de Teste 04: Adicionar Cliente
###Acessar a página home do site

Clicar em "Sign in"
### Comando utilizado para clicar no link de login (Sign in)
    Click Element       xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Sleep   2

Informar um e-mail válido
### Clica dentro do campo e-mail e inseri um e-mail válido
    Click Element   xpath=//*[@id="email_create"]
    #Input Text      name=email_create   ${EMAIL}
    Press Keys     xpath=//*[@id="email_create"]    CTRL+v

Clicar em "Create an account"
### Clica em Criar uma conta
    Click Element   xpath=//*[@id="SubmitCreate"]

Preencher os dados obrigatórios
### Verifica se o elemento que estamos aguardando está na tela, nesse caso o Título do Site.  
    Title Should Be     Login - My Store
### Verifica se o elemento que estamos aguardando está na tela, nesse caso verifica o nome da categoria que entrou.    
    Wait Until Element Is Visible      xpath=//*[@id="account-creation_form"]
    Sleep  2

### Dados dos formulários

### Preenchendo os campos obrigatórios para dados Pessoais (*)
    Input Text      id=customer_firstname     ${NOME}
    Input Text      id=customer_lastname      ${SOBRENOME}
    Input Text      id=passwd                 ${PASSWD}
     
### Preenchendo os campos obrigatórios para dados de Endereço (*)
    Input Text      id=firstname              ${NOME}
    Input Text      id=lastname               ${SOBRENOME}
    Input Text      id=address1               ${ADRESS}
    Input Text      id=city                   ${CITY}
    Click Element                             xpath=//*[@id="id_state"]/option[15]
    Input Text      id=postcode               ${POSTCODE}
    Input Text      id=phone_mobile           ${PHONE}
    Input Text      id=alias                  ${ALIAS}

Submeter cadastro
### Confirmando o envio do formulário de cadastro
    Click Element       xpath=//*[@id="submitAccount"]/span

Conferir se o cadastro foi efetuado com sucesso
### Confirmando os dados da conta após o cadastro!
### Confirma se o título da págia está correto!    
    Title Should Be     My account - My Store
### Confirma se está dentro do cadastro
    Wait Until Element Is Visible      xpath=//*[@id="center_column"]/h1
    Wait Until Element Is Visible      xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a/span
### Clica no menu My Personal Information    
    Click Element       xpath=//*[@id="center_column"]/div/div[1]/ul/li[4]/a
### Confirma se o título da págia está correto!    
    Title Should Be     Identity - My Store
### Confirma se está dentro do cadastro
    Wait Until Element Is Visible      xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a/span
### Clica no menu home    
    Click Element       xpath=//*[@id="center_column"]/ul/li[2]/a
    sleep   2
### Clica no menu "meu nome" (Nome este criado no formulário de cadastro)
    Click Element       xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Sleep   2
### Efetua o Sign out da pagina (desloga do portal)    
    Click Element       xpath=//*[@id="header"]/div[2]/div/div/nav/div[2]/a
    Sleep   2

### Confirmando se a conta foi criada com sucesso após o cadastro!
### Efetua o Sign in da pagina (Logar ao portal)
### Inserindo e-mail cadastrado
    Click Element       xpath=//*[@id="email"]
    #Input Text          id=email            ${EMAIL}
    Press Keys     xpath=//*[@id="email"]    CTRL+v

### Inserindo Senha cadastrado
    Click Element       xpath=//*[@id="passwd"]
    Input Text          id=passwd           ${PASSWD}
### Efetuar o loggin
    Click Element       xpath=//*[@id="SubmitLogin"]/span
### Confirma se o título da págia está correto!    
    Title Should Be     My account - My Store
### Confirma se está dentro do cadastro
    Wait Until Element Is Visible      xpath=//*[@id="center_column"]/h1
    Sleep   5
### Apenas Imprimindo a categoria que estamos, para validação.      
    Log To Console                 Exercío 04 Passou com sucesso!        
    Log To Console                 Você está dentro de uma área segura logado com o email: Copiado do primeiro site




###Caso de teste 05: Copiando um email validação
#Acessar a pagina geradora de e-mail temporários

    #Go To       ${URL2}

#Copiar o endereço de e-mail
    
 #   Click Element       xpath=//*[@id="copy-button"]
   # ${EMAILCOPIADO}   Get Text   xpath=//*[@id="copy-button"]
    
#Armazenar o e-mail para a aplicação em execução

   # Go To       ${URL}
   # Click Element   xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
  #  Sleep   2
#### Clica dentro do campo e-mail e inseri um e-mail válido
   # Click Element   xpath=//*[@id="email_create"]
    #Input Text      name=email_create      ${EMAILCOPIADO}
  #  Sleep   2
#### Cola o E-mail copiado no site
   # Press Keys     xpath=//*[@id="email_create"]    CTRL+v
    ###Click Element   xpath=//*[@id="email_create"]
 #   sleep   2
### Clica em Criar uma conta
   # Click Element   xpath=//*[@id="SubmitCreate"]
   # Sleep   2

### Apenas Imprimindo a categoria que estamos, para validação. 
    ###${all_text}=    CTRL+v
    ###Log    Text box content was: ${all_text}
    ###${EMAILCOPIADO}=  Get clipboard value 
   # Log To Console                 Exercío 06 Passou com sucesso!        
    #Log To Console                 Você está dentro de uma área segura logado com o email: ${EMAILCOPIADO}



