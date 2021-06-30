*** Settings ***
Documentation   Aqui estarão presente os exercícios do prime experts.
...             Lembrando que é de suma importância termos descrição de cada arquivo.


*** Variables ***
${Nome}     Marcelo

&{PESSOA}   
...             nome=Marcelo
...             sobrenome=Ng
...             idade=37
...             carro=Fielder
...             cpf=01234567899
...             sexo=Masculino

@{FRUTAS}
...             abacaxi
...             laranja
...             morango
...             banana
...             pera

@{LISTAFRUTAS}       abacaxi     laranja     morango     banana      pera

@{PAISES}       Brasil      Espanha     Argentina       Portugal    Italia      Canada      Belgica

*** Keywords ***
Somar dois numeros
    [Arguments]     ${NUM_A}        ${NUM_B}
    ${SOMA}     Evaluate        ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}


Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}     Evaluate        ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}


Criando e-mail
    [Arguments]         ${NOME}     ${SOBRENOME}    ${IDADE}
    ${EMAIL}    Catenate    SEPARATOR=_     ${NOME}     ${SOBRENOME}    ${IDADE}@robot.com
    [Return]        ${EMAIL}

Contar de 0 a 9
    FOR     ${count}    IN RANGE    0   9
        Log To Console      ${count} 
    END 


Percorrer itens de uma lista
    FOR   ${fruta}      IN  @{LISTAFRUTAS}
        Log To Console      ${fruta}
    END    

Contador de 0 a 10
    FOR     ${numero}       IN RANGE    0   10
        Log To Console      Estou no numero: ${numero}
    END


Imprimir 5 nomes de paises diferentes
    FOR     ${paises}       IN  @{PAISES} 
        Log To Console      Estou no País: ${paises}
    END

Imprimir 5 nomes de paises diferentes com IF
    FOR     ${paises}       IN  @{PAISES} 

        Exit For Loop If    '${paises}'=='Canada'

        Log To Console      Estou no País: ${paises}
    END


Tomar decisão
    [Arguments]     ${NOME}
    IF       '${NOME}'=='Maria'
        Log To Console      Vou fazer isso só quando for a Maria!
    ELSE IF     '${NOME}'=='João'
        Log To Console      Vou fazer isso só quando for o João!
    ELSE
        Log To Console      Vou fazer isso aqui quando for qualquer pessoa!
        END 


Else e IF com FOR
    [Arguments]     ${NUM_A}        ${NUM_B}
    FOR     ${numero}   IN RANGE       ${NUM_A}        ${NUM_B}

        IF  '${numero}'=='5'
            Log To Console      Estou no número: ${numero}
        ELSE IF     '${numero}'=='8'
            Log To Console      Estou no número: ${numero}
        END
    END



*** Test Case ***
Cenários: Imprimir todas as informações da PESSOA contidas no dicionário.
    [Tags]      DADOS
    Log To Console      ${PESSOA.nome}
    Log To Console      ${PESSOA.sobrenome}
    Log To Console      ${PESSOA.idade}
    Log To Console      ${PESSOA.carro}
    Log To Console      ${PESSOA.cpf}
    Log To Console      ${PESSOA.sexo}
    

Cenário: Imprimir a lista de FRUTAS.
    [Tags]      FRUTAS
    Log To Console       este(a) é: ${FRUTAS[0]}
    Log To Console       este(a) é: ${FRUTAS[1]}
    Log To Console       este(a) é: ${FRUTAS[2]}
    Log To Console       este(a) é: ${FRUTAS[3]}
    Log To Console       este(a) é: ${FRUTAS[4]}

cenário: Imprimir a lista completa de Frutas em um único código. 
    [Tags]      FRUTAS   
    Log To Console      ${LISTAFRUTAS}

Cenario: Meu teste de Somar
    [Tags]      SOMA
    ${RESULTADO}            Somar dois numeros  10  35
    Log To Console          ${RESULTADO}

    ${RESULTADO_B}          Somar os numeros "1562" e "1895"
    Log To Console          ${RESULTADO_B}

Cenario: Criando meu e-mail
    [Tags]      EMAIL
    ${EMAIL_NOVO}           Criando e-mail  Marcelo    Ng   37
    Log To Console          ${EMAIL_NOVO}

Cenario: Utilizando FOR na pratica
    [Tags]          LOOPING
    Contar de 0 a 9

Cenario: Imprimir lista de Frutas
    [Tags]          LISTA
    Percorrer itens de uma lista


Cenario: FOR exercicio 1
    [Tags]          EXERC_01
    Contador de 0 a 10

Cenario: Imprimir paises
    [Tags]          PAISES
    Imprimir 5 nomes de paises diferentes

Cenario: Imprimir paises com Exit for loop if
    [Tags]          Exerc_Paises
    Imprimir 5 nomes de paises diferentes com IF

Cenario: Imprimir os IF
    [Tags]          Exerc_IF
    Tomar decisão   Marcelo

Cenario: Contar numero
    [Tags]      EXERC_IF_ELSE
    Else e IF com FOR  1    10