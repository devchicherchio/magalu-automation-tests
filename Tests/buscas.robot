** Settings **
Resource  ../Steps/Main_Steps.robot

*** Test Cases ***
TC01 - Buscar produtos samsung
    [Documentation]    Este caso de teste verifica a busca por produtos Samsung.
    Dado que estou na página inicial do site Magazine Luiza
    Quando digito "samsung" no campo de busca
    E clico no ícone de busca
    Então devo ser redirecionado para uma página com os resultados da busca
    E todos os resultados da primeira página devem ser produtos da marca Samsung

TC02 - Buscar produtos LG
    [Documentation]    Este caso de teste verifica a busca por produtos LG.
    Dado que estou na página inicial do site Magazine Luiza
    Quando digito "LG" no campo de busca
    E clico no ícone de busca
    Então devo ser redirecionado para uma página com os resultados da busca
    E todos os resultados da primeira página devem ser produtos da marca LG
    
TC03 - Buscar produtos apple
    [Documentation]    Este caso de teste verifica a busca por produtos apple.
    Dado que estou na página inicial do site Magazine Luiza
    Quando digito "apple" no campo de busca
    E clico no ícone de busca
    Então devo ser redirecionado para uma página com os resultados da busca
    E todos os resultados da primeira página devem ser produtos da marca apple   

