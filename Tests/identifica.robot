** Settings **
Resource  resource.robot


*** Test Cases ***
TC01 - Cadastrar email não existente
    [Tags]   teste_regressivo
    [Documentation]    Este caso de teste verifica o cadastro de um email não existente.
    Dado que estou na página de identificação do site Magazine Luiza
    Quando informo um email sem cadastro na plataforma
    E clico no botão de continuar
    Então devo ser redirecionado para a página de cadastro

TC02 - Cadastrar email existente
    [Tags]   teste_regressivo
    [Documentation]    Este caso de teste verifica o comportamento ao tentar cadastrar um email já existente.
    Dado que estou na página de identificação do site Magazine Luiza
    Quando informo um email já cadastrado na plataforma
    E clico no botão de continuar
    Então devo permanecer na mesma página
    E devo visualizar uma mensagem informando que já existe uma conta com esse email

TC03 - Cadastrar com formato de email incorreto
    [Tags]   teste_regressivo
    [Documentation]    Este caso de teste verifica o comportamento ao tentar cadastrar um email com um formato incorreto.
    Dado que estou na página de identificação do site Magazine Luiza
    Quando informo um email em um formato incorreto
    E clico no botão de continuar
    Então devo permanecer na mesma página
    E devo visualizar uma mensagem informando que o e-mail não foi digitado corretamente

TC04 - Logar com formato de email incorreto
    [Tags]   teste_regressivo
    [Documentation]    Este caso de teste verifica o comportamento ao tentar fazer login com um formato de email incorreto.
    Dado que estou na página de identificação do site Magazine Luiza
    Quando informo um email na aba de já sou cliente com um formato incorreto
    E senha 
    Então devo permanecer na mesma página
    E devo visualizar uma mensagem pedindo para inserir um CPF, CNPJ ou E-mail válido

TC05 - Logar com email não cadastrado
    [Tags]   teste_regressivo
    [Documentation]    Este caso de teste verifica o comportamento ao tentar fazer login com um email não cadastrado.
    Dado que estou na página de identificação do site Magazine Luiza
    Quando informo um email não cadastrado na aba de já sou cliente
    E senha 
    E clico no segundo botão de continuar
    Então devo permanecer na mesma página
    E devo visualizar uma mensagem pedindo para verificar o login e a senha para continuar

TC06 - Logar com email cadastrado
    [Tags]   teste_regressivo
    [Documentation]    Este caso de teste verifica o comportamento ao tentar fazer login com um email cadastrado.
    Dado que estou na página de identificação do site Magazine Luiza
    Quando informo um email cadastrado na aba de já sou cliente
    E senha 
    E clico no segundo botão de continuar
    Então devo ser redirecionado para a página inicial
    E devo estar logado como cliente


    
    

