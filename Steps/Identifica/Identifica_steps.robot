*** Setting *** 
Resource  ../../Resource/settings.resource
Resource  ../../Elements/Main_Elements.resource

** Keywords **
abri o navegador
    Open Browser
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



    



