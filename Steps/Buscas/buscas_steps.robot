*** Setting *** 
Resource  ../../Resource/settings.resource
Resource  ../../Elements/Main_Elements.resource

** Keywords **

Dado que estou na página inicial do site Magazine Luiza
    Open Browser  https://www.magazineluiza.com.br  chrome
    Maximize Browser Window

Quando digito "samsung" no campo de busca
    Wait Until Element Is Visible  ${BUSCA_INPUT}   10s
    input Text      ${BUSCA_INPUT}   samsung
    Sleep    2s

Quando digito "LG" no campo de busca
    Wait Until Element Is Visible  ${BUSCA_INPUT}   10s
    input Text      ${BUSCA_INPUT}   LG
    Sleep    2s

Quando digito "apple" no campo de busca
    Wait Until Element Is Visible  ${BUSCA_INPUT}   10s
    input Text      ${BUSCA_INPUT}   apple
    Sleep    2s

E clico no ícone de busca
    Click Element    ${BUSCA_ICONE}
    Sleep  10s

Então devo ser redirecionado para uma página com os resultados da busca
    ${current_url}=    Get Location
    Log    URL Atual: ${current_url}
    Should Contain    ${current_url}    https://www.magazineluiza.com.br/busca

E todos os resultados da primeira página devem ser produtos da marca Samsung
    ${elementos_h2} =    Get WebElements    //h2[@data-testid="product-title"]
    FOR    ${elemento}    IN    @{elementos_h2}
        ${texto_elemento} =    Get Text    ${elemento}
        # Tentar encontrar 'Samsung'
        ${contem_samsung} =    Run Keyword And Return Status    Should Contain    ${texto_elemento}    Samsung
        Run Keyword If    not ${contem_samsung}    Should Contain    ${texto_elemento}    Galaxy
        Run Keyword If    ${contem_samsung}    Log    Encontrou 'Samsung'
        Run Keyword If    not ${contem_samsung}    Log    Não encontrou 'Samsung', mas encontrou 'Galaxy'

    END
    Close Browser
E todos os resultados da primeira página devem ser produtos da marca LG
    ${elementos_h2} =    Get WebElements    //h2[@data-testid="product-title"]
    FOR    ${elemento}    IN    @{elementos_h2}
        ${texto_elemento} =    Get Text    ${elemento}
        ${contem_lg} =    Run Keyword And Return Status    Should Contain    ${texto_elemento}    LG
        Run Keyword If    not ${contem_lg}    Should Contain    ${texto_elemento}    Lg
        Run Keyword If    ${contem_lg}    Log    Encontrou 'LG'
        Run Keyword If    not ${contem_lg}    Log    Não encontrou 'LG', mas encontrou 'Galaxy'

    END
    Close Browser

E todos os resultados da primeira página devem ser produtos da marca apple
    ${elementos_h2} =    Get WebElements    //h2[@data-testid="product-title"]
FOR    ${elemento}    IN    @{elementos_h2}
    ${texto_elemento} =    Get Text    ${elemento}
    ${contem_apple} =    Run Keyword And Return Status    Should Contain    ${texto_elemento}    apple
    ${contem_apple2} =    Run Keyword If    not ${contem_apple}    Should Contain    ${texto_elemento}    Apple
    Run Keyword If    not ${contem_apple2}    Should Contain    ${texto_elemento}    iphone
    Run Keyword If    ${contem_apple}    Log    Encontrou 'Apple'
    Run Keyword If    not ${contem_apple}    Log    Não encontrou 'apple', mas encontrou 'Apple'
    Run Keyword If    not ${contem_apple2}    Log    Não encontrou 'apple', não encontrou 'Apple', mas encontrou 'Iphone'
END
    Close Browser
