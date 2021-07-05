###########################################################################################################
###                                                                                                     ###
###                                 Desenvolvido por Marcelo Ng                                         ###
###                                                                                                     ###
### Atividade passada por Helder Fernandes no curso da Prime Experts, turma 4 (21/06/2021 à 02/07/2021) ###
###                                                                                                     ###
###########################################################################################################

*** Settings ***
Documentation       Aqui estarão presentes todos os testes de automação do Android

### Chama o arquivo que contém nossas regras
Resource        ../resources/Resource_mobile.robot

### Regras para ações
Test Setup          Abrir o aplicativo
Test Teardown       Fechar o aplicativo


*** Test Case ***
Caso de Teste 01: Pesquisar cursos do robot
    [Tags]          PESQUISA
    Dado que o cliente esteja na tela home
    E pesquisa por "robotframework"
    Quando clicar em Pesquisar
    Então serão apresentados vídeos sobre Robot Framework

Caso de Teste 02: Logar no YouTube
    [Tags]          LOGAR
    #Abrir App
    ### Apenas irá logar com a conta contatesteprimeexpert@gmail.com, caso não esteja logado!
    ### Se houver logado, irá utilizar o email: contatesteprimeexpert1@gmail.com
    Logar no aplicativo com a conta contatesteprimeexpert@gmail.com
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
    Clicar no vídeo

Caso de Teste 03: Usar método Swipe na tela
    [Tags]          TELA
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
    Clicar no vídeo