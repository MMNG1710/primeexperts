*** Settings ***
Documentation       Responsável por armazenar todas as nossa Keyword e Variáveis de nosso Projeto de automação WEB.

Library     SeleniumLibrary
Library     String
Library     WebElement

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
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    
Fechar navegador
    Close Browser   

Acessar a pagina geradora de e-mail temporários
    Go To       ${URL2}

Copiar o endereço de e-mail
    Click Element       xpath=//*[@id="copy-button"]

Armazenar o e-mail para a aplicação em execução
    Go To       ${URL}

#Clicar em "Sign in"
### Comando utilizado para clicar no link de login (Sign in)
    Click Element       xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Sleep   2

#Informar um e-mail válido
### Clica dentro do campo e-mail e inseri um e-mail válido
 #   Click Element   xpath=//*[@id="email_create"]
 #   Input Text      name=email_create   ${EMAIL}
   Press Keys     xpath=//*[@id="email_create"]    CTRL+v
    ###Click Element   xpath=//*[@id="email_create"]
 #   sleep   2

##Clicar em "Create an account"
### Clica em Criar uma conta
    Click Element   xpath=//*[@id="SubmitCreate"]

#Preencher os dados obrigatórios
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

#Submeter cadastro
### Confirmando o envio do formulário de cadastro
    Click Element       xpath=//*[@id="submitAccount"]/span

#Conferir se o cadastro foi efetuado com sucesso
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
 #   Input Text          id=email            ${EMAIL}
    Press Keys     xpath=//*[@id="email"]    CTRL+v
### Inserindo Senha cadastrado
    Click Element       xpath=//*[@id="passwd"]
    Input Text          id=passwd           ${PASSWD}
### Efetuar o loggin
    Click Element       xpath=//*[@id="SubmitLogin"]/span
### Confirma se o título da págia está correto!    
    Title Should Be     My account - My Store
### Confirma se está dentro do cadastro

##    ${EMAILCOPIADO}=  Get clipboard value 
    Log To Console                 Exercío 06 Passou com sucesso!        
    Log To Console                 Você está dentro de uma área segura logado com o email: Press Keys CRTL+v