###########################################################################################################
###                                                                                                     ###
###                                 Desenvolvido por Marcelo Ng                                         ###
###                                                                                                     ###
### Atividade passada por Helder Fernandes no curso da Prime Experts, turma 4 (21/06/2021 à 02/07/2021) ###
###                                                                                                     ###
###########################################################################################################

*** Settings ***
Documentation       Responsável por armazenar todas as nossa Keyword e Variáveis de nosso Projeto de automação do Android

Library             AppiumLibrary
Library             String

*** Variable ***
### Login e senha para uma conta do youtube
${EMAIL}            contatesteprimeexpert@gmail.com
${EMAIL2}           contatesteprimeexpert1@gmail.com
${SENHA}            123Mudar!@#
### Logo do Youtube
${LOGO}                     accessibility_id=YouTube
### MENU de login/conta do youtube
${CONTA}                    xpath=//android.widget.ImageView[@content-desc="Conta"]
### Pesquisar e validar o item pesquisado
${BOTAOPESQUISA}            accessibility_id=Pesquisar
${CAIXAPESQUISA}            id=com.google.android.youtube:id/search_edit_text
${CAIXAPESQUISADA}          id=com.google.android.youtube:id/search_query
${LAYOUTDEPAGINA_ID}        id=com.google.android.youtube:id/slim_status_bar_player_container
${LAYOUTDEPAGINA_xpath}     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout
${VALIDA_PESQUISA_INDEX}    xpath=//*[contains(@index, '1')]
${VALIDA_PESQUISA_NOME}     xpath=//*[contains(@content-desc, 'Robot')]
${PESQUISA}                 Robotframework
### Todas variáveis adicionar o primeiro login do aparelho
${BOTAOLOGIN}               id=com.google.android.youtube:id/button
#${BOTAOLOGIN}               xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TextView[3]
${WAITBOTAOLOGIN}           resource_id=com.google.android.youtube:id/thumbnail
#${VALIDA_LOGIN}             XPATH=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout
${VALIDA_LOGIN}             id=com.google.android.youtube:id/body_text
${CRIAR_CONTA}              id=com.google.android.youtube:id/name
### Todas variáveis para efetuar login (caso haja uma conta no aparelho)
${LOGIN}                    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.support.v7.widget.RecyclerView/android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.RelativeLayout/android.widget.TextView
#${WAITLOGIN}                id=com.google.android.youtube:id/account_thumbnail
${WAITLOGIN}                xpath=//android.widget.ImageView[@content-desc="Seu canal"]
### Variáveis PADRÃO PARA AUTENTICAR UM EMAIL GOOGLE VÁLIDO
${CLICAR_CAMPO_EMAIL}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[2]/android.view.View
${INSERIR_EMAIL}            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[1]/android.widget.EditText
${CLICAR_AVANÇAR}           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[4]/android.view.View/android.widget.Button
${CLICAR_CAMPO_SENHA}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View[3]
${INSERIR_SENHA}            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View[1]/android.widget.EditText
${CLICAR_LOGIN}             xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[4]/android.view.View
#${CLICAR_LOGIN}            id=passwordNext
### Aceitando um termo de uso para novo usuário no aparelho
${CONCORDAR_BOTAO_LOGIN}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[4]/android.view.View
#${CONCORDAR_BOTAO_LOGIN}       id=signinconsentNext
${MAIS_BOTAO_LOGIN}         xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.Button
${ACEITAR_BOTAO_LOGIN}      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.Button
### Todas variáveis de Login Anônimo
${LOGIN_ANONIMO}            xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.support.v7.widget.RecyclerView/android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView
${CLICK_OK}                 id=android:id/button1
### Abrir o MENU Explorar descer a tela e clicar no vídeo.
${BOTAOEXPLORAR}            xpath=//android.widget.Button[@content-desc="Explorar"]
${VERIFICA_VIDEO}           xpath=(//android.widget.ImageView[@content-desc="Ir ao canal"])[3]
${CLICAR_VIDEO}             xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[3]/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ImageView
${SWIPE}                    Swipe    650    500    700    300


*** Keywords ***
Abrir o aplicativo
    Open Application            http://localhost:4723/wd/hub
    ...                         automationName=uiautomator2
    ...                         platformName=Android
    ...                         deviceName=emulator-5554
    ...                         autoGrantPermissions=true
    ...                         appPackage=com.google.android.youtube
    ...                         appActivity=com.google.android.youtube.HomeActivity
    Sleep                       10
Fechar o aplicativo
    Capture Page Screenshot
    Close Application

### Exercicio 01
### Cenário: Pesquisar cursos do robotframework
Dado que o cliente esteja na tela home
    ### Verifica se o logo da aplicação está visível na tela.
    wait Until Element Is Visible           ${LOGO} 
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    Log To Console                          Você concluíu com sucesso a verificação do logo do APP.
    Sleep   5
### Inserir o assunto a ser pesquisado  
E pesquisa por "${PESQUISA}"
    #### Clica dentro da barra de PESQUISA
    Click Element                           ${BOTAOPESQUISA}
    ### Inserir dentro da barra de PESQUISA o item a ser procurado, nesse caso 'robotframework'
    Input Text                              ${CAIXAPESQUISA}         ${PESQUISA}
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    Log To Console                          Você concluíu com sucesso a pesquisa do assunto: ${PESQUISA}.
### clicar no botão "PESQUISAR"  
Quando clicar em Pesquisar
    ### Comando ENTER
    Press Keycode           66 
    ### Apenas Imprimindo a categoria que estamos, para validação.
    Log To Console                          Você concluíu com sucesso o comando: ENTER
### Validador de tela para saber se nossa pesquisa foi validada com sucesso!    
Então serão apresentados vídeos sobre Robot Framework
   ### Feito em aula, porém não foi válido no meu app!!!
    #Wait Until Element Is Visible       xpath=/hieraarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.support.v7.widget.RecyclerView/android.view.ViewGroup[3]/android.view.ViewGroup[1]
    #Wait Until Element Is Visible       xpath=//*[contains(@text, "QArentena 66")]
    #Wait Until Element Is Visibre       xpath=//android.view.ViewGroup[@content-desc="QArentena 66: Robot Framework, por Mayara R. Fernandes - 2 horas e 49 minutos - Ir ao canal - Iterasys - 4,1 mil visualizações - Transmitido há 7 meses - assistir o vídeo"]
    #Wait Until Element Is Visible       elementId=62b67f9c-d083-4695-9179-f8071518c98d
   ### Encontrato
    ### Verifica se o quadro central com a consulta está na tela!
    Wait Until Element Is Visible       ${LAYOUTDEPAGINA_ID}   2
    Wait Until Element Is Visible       ${LAYOUTDEPAGINA_xpath}   1
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    Log To Console                          Validação do QUADRO CENTRAL com Sucesso!
    ### Verifica se o nome Robotframework foi exibido na procura
    Wait Until Element Is Visible       ${CAIXAPESQUISADA}  1
    #Wait Until Element Is Visible       xpath=//[contains(@text, "robotframework")]
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    Log To Console                          Validação da barra de PESQUISA com Sucesso!
    ### Identifica se o primeiro título do acervo possui caracteristicas sobre Robotframework
    Wait Until Element Is Visible       ${VALIDA_PESQUISA_INDEX}    2
    #Wait Until Element Is Visible       xpath=//*[contains(@content-desc, 'QArentena 66: Robot Framework, por Mayara R. Fernandes - 2 horas e 49 minutos - Ir ao canal - Iterasys - 4,1 mil visualizações - Transmitido há 7 meses - assistir o vídeo')]
    Wait Until Element Is Visible       ${VALIDA_PESQUISA_NOME}    2
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    Log To Console                          Você concluíu com sucesso a pesquisa do assunto: ${PESQUISA}

### Exercicio 02
### Caso de Teste 02: Logar no YouTube
### Apenas irá logar com a conta contatesteprimeexpert@gmail.com, caso não esteja logado!
### Se houver logado, irá utilizar o email: contatesteprimeexpert1@gmail.com
Logar no aplicativo com a conta contatesteprimeexpert@gmail.com
    ### Verifica se o logo da aplicação está visível na tela.
    Wait Until Element Is Visible           ${LOGO}     3
    ### Clica no MENU login
     Click Element       ${CONTA}
     Sleep               2
        ### INICIA VERIFICAÇÃO DE UMA CONDIÇÃO NA TELA, ONDE DEVE SER HAVALIADO SE HÁ OU NÃO UMA CONTA JÁ LOGADA!
        ### Valida que o que está na tela e encaminha para a ação correta.
        ${p}  Run Keyword And Ignore Error  Wait Until Element Is Visible  ${VALIDA_LOGIN}
        ### Se for positivo, chamará a função para novo login
        Run Keyword If      '${p[0]}' == 'PASS'  Validar novo login
        ### Se for positivo, chamará a função para login
        Run Keyword If      '${p[0]}' == 'FAIL'  Validar Login existente

Validar novo login
        ### Verifica se é um novo LOGIN!            
        ### Apenas Imprimindo a categoria que estamos, para validação.      
        Log To Console                          Usuário não Logado!
        ### Apenas Imprimindo a categoria que estamos, para validação.      
        Log To Console                          Usuário não Logado, cadastranto novo LOGIN!   
        ### Acessando com a nova conta ()
        Click Element       ${BOTAOLOGIN}
        Sleep               5
        Click Element       ${CRIAR_CONTA}
        Sleep               10
        ### Inserindo email de login
        Click Element       ${CLICAR_CAMPO_EMAIL}
        Sleep               5
        Input Text          ${INSERIR_EMAIL}     ${EMAIL}
        Sleep               5        
        Click Element       ${CLICAR_AVANÇAR}
        Sleep               5
        ### Inserindo senha de Login
        Click Element       ${CLICAR_CAMPO_SENHA}
        Sleep               5        
        Input Text          ${INSERIR_SENHA}  ${SENHA}
        Sleep               5        
        Click Element       ${CLICAR_LOGIN}
        #Click Button        ${CLICAR_LOGIN}
        Sleep               5
        ### Concordando com os termos de uso
        Click Element       ${CONCORDAR_BOTAO_LOGIN}
        #Click Button       ${CONCORDAR_BOTAO_LOGIN}
        Sleep               7
        Click Element       ${MAIS_BOTAO_LOGIN}
        Sleep               3
        Click Element       ${ACEITAR_BOTAO_LOGIN}
        Sleep               35
        ### Apenas Imprimindo a categoria que estamos, para validação.      
        Log To Console                          Você Logou com sucesso como novo usuário: ${EMAIL}  
           
Validar Login existente
        ### Apenas Imprimindo a categoria que estamos, para validação.      
        Log To Console                          Já existe um usuário ativo, cadastranto novo LOGIN!        
        ### Apenas Imprimindo a categoria que estamos, para validação.      
        Log To Console                          Cadastranto novo LOGIN! 
        ### Efetua login com novo usuário
        ### Clica no MENU login e Adiciona uma nova conta
        Click Element       ${LOGIN}
        Sleep               10
        ### Inserindo email de login
        Click Element       ${CLICAR_CAMPO_EMAIL}
        Sleep               5
        Input Text          ${INSERIR_EMAIL}      ${EMAIL2}
        Sleep               5        
        Click Element       ${CLICAR_AVANÇAR}
        Sleep               5
        ### Inserindo senha de Login
        Click Element       ${CLICAR_CAMPO_SENHA}
        Sleep               5        
        Input Text          ${INSERIR_SENHA}  ${SENHA}
        Sleep               5        
        Click Element       ${CLICAR_LOGIN}
        #Click Button        ${CLICAR_LOGIN}
        Sleep               5
        ### Concordando com os termos de uso
        Click Element       ${CONCORDAR_BOTAO_LOGIN}
        #Click Button       id=signinconsentNext
        Sleep               35
        ### Apenas Imprimindo a categoria que estamos, para validação.  
        Log To Console                          Você Logou com sucesso com outra: ${EMAIL2}
        #ELSE
        ### Efetua login como Anônimo
        ### Clica no MENU login e altera o modo para anônimo
    #     Click Element       ${LOGIN_ANONIMO}
    #     Sleep               2
    #     Click Element       ${CLICK_OK} 
    #     ### Apenas Imprimindo a categoria que estamos, para validação.  
    #     Log To Console                          Você Locou com sucesso como Anônimo!


Entrar no menu “Explorar”
    ### Clica no MENU INFERIOR EXPLORAR
    #Sleep                   5
    #Comando ESC, utilizado apenas para testes
    #Press Keycode           111
    Sleep                   2
    Click Element           ${BOTAOEXPLORAR}
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    Log To Console                          Você Clicou com sucesso no MENU EXPLORAR!
### Movimentará a tela até o item 10 da página
Usar swipe de tela até o 10 item da tela
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Swipe    650    500    700    300
    Sleep       2
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    Log To Console                          Parabéns, você desceu a tela até o item 10 da lista!
    #END
### Clica no 10º VÍDEO da tela.
Clicar no vídeo
    Wait Until Element Is Visible           ${VERIFICA_VIDEO}  5
    Click Element                           ${CLICAR_VIDEO}   
    Sleep                                   10
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    Log To Console                          Você Clicou com sucesso no VÍDEO!
    ##Tap             205    522
    #Click Element       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[3]/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ImageView
    #Sleep       10
    #Click Element       xpath=com.google.android.youtube:id/thumbnail_layout
    ### Apenas Imprimindo a categoria que estamos, para validação.  
    #Log To Console                          Você Clicou com sucesso no VÍDEO!