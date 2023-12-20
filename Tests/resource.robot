** Settings **
Library  SeleniumLibrary

** Variables **
#Elementos da pagina de identificação
${EMAIL_INPUT_SELECTOR}             //input[@name="login"]
${SENHA_INPUT_SELECTOR}             //input[@name="password"]
${EMAIL_2_INPUT_SELECTOR}           //input[@autocomplete="username"]
${BUTTON_SELECTOR}                  css:button.LoginBox-form-continue
${BUTTON_2_SELECTOR}                //button[@id="login-box-form-continue"]
${BUTTON_USER}                      //button[@data-testid="dropdown-title"]
${SENHA_TEXT}                       @Matheus58722009
${EMAIL_INCORRETO}                  maverim816.com
${EMAIL_NAO_CADASTRADO}             maverim816@gearstag.com
${EMAIL_CADASTRADO}                 matheuschicherchio@hotmail.com
${BUSCA_INPUT}                      //input[@type="search"]
${BUSCA_ICONE}                      css=#search-container > div > svg


** Keywords **
abri o navegador
    Open Browser
Dado que estou na página de identificação do site Magazine Luiza
    Open Browser  https://sacola.magazineluiza.com.br/#/cliente/login  chrome
    Maximize Browser Window
Dado que estou na página inicial do site Magazine Luiza
    Open Browser  https://www.magazineluiza.com.br  chrome
    Maximize Browser Window
Quando informo um email sem cadastro na plataforma
    Wait Until Element Is Visible  ${EMAIL_INPUT_SELECTOR}   10s
    input Text      ${EMAIL_INPUT_SELECTOR}   ${EMAIL_NAO_CADASTRADO}
    Sleep   1s
Quando informo um email em um formato incorreto
    Wait Until Element Is Visible  ${EMAIL_INPUT_SELECTOR}   10s
    input Text      ${EMAIL_INPUT_SELECTOR}   ${EMAIL_INCORRETO}
    Sleep   1s
Quando informo um email não cadastrado na aba de já sou cliente
    Wait Until Element Is Visible  ${EMAIL_2_INPUT_SELECTOR}   10s
    input Text      ${EMAIL_2_INPUT_SELECTOR}   ${EMAIL_NAO_CADASTRADO}
    Sleep   1s

Quando informo um email cadastrado na aba de já sou cliente
    Wait Until Element Is Visible  ${EMAIL_2_INPUT_SELECTOR}   10s
    input Text      ${EMAIL_2_INPUT_SELECTOR}   ${EMAIL_CADASTRADO}
    Sleep   1s

Quando informo um email na aba de já sou cliente com um formato incorreto
    Wait Until Element Is Visible  ${EMAIL_2_INPUT_SELECTOR}   10s
    input Text      ${EMAIL_2_INPUT_SELECTOR}   ${EMAIL_INCORRETO}
    Sleep   1s
E senha 
    Wait Until Element Is Visible  ${SENHA_INPUT_SELECTOR}   10s
    input Text      ${SENHA_INPUT_SELECTOR}   ${SENHA_TEXT}
    Sleep   1s
Quando informo um email já cadastrado na plataforma
    Wait Until Element Is Visible  ${EMAIL_INPUT_SELECTOR}   10s
    input Text      ${EMAIL_INPUT_SELECTOR}   ${EMAIL_CADASTRADO}
E clico no botão de continuar
    click Button    ${BUTTON_SELECTOR}
E clico no segundo botão de continuar
    click Button    ${BUTTON_2_SELECTOR}
    Sleep   5s
Então devo ser redirecionado para a página de cadastro
    Wait Until Page Contains    Endereço de cobrança   timeout=10s
    ${current_url}=    Get Location
    Log    URL Atual: ${current_url}
    Should Contain    ${current_url}    https://sacola.magazineluiza.com.br/#/cliente/cadastro
    Close Browser
Então devo ser redirecionado para a página inicial
    ${current_url}=    Get Location
    Log    URL Atual: ${current_url}
    Should Contain    ${current_url}    https://www.magazineluiza.com.br

Então devo permanecer na mesma página
    ${current_url}=    Get Location
    Log    URL Atual: ${current_url}
    Should Contain    ${current_url}    https://sacola.magazineluiza.com.br/#/cliente/login

E devo visualizar uma mensagem informando que já existe uma conta com esse email
    Wait Until Page Contains    Já existe uma conta com esse e-mail.   timeout=10s
    Close Browser

E devo visualizar uma mensagem informando que o e-mail não foi digitado corretamente
    Wait Until Page Contains     O e-mail não foi digitado corretamente.        timeout=10s
    Close Browser

E devo visualizar uma mensagem pedindo para verificar o login e a senha para continuar
    Wait Until Page Contains    Verifique o login e a senha para continuar.   timeout=10s
    Close Browser


E devo visualizar uma mensagem pedindo para inserir um CPF, CNPJ ou E-mail válido
    Wait Until Page Contains    Insira um CPF, CNPJ ou E-mail válido.             timeout=10s
    Close Browser

deve fechar o navegador 
    Close Browser
abrir site da globo
    Open Browser  https://ge.globo.com/  chrome

E devo estar logado como cliente
    Element Should Be Visible  ${BUTTON_USER}
    Close Browser
    
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
