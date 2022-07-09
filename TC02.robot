*** Settings ***

Library  RequestsLibrary
Library  Collections
Library  OperatingSystem

*** Variables ***

${base_url}       http://hlg-oms-corporativo.api-cnova.com.br
${endpoint}       /inventario/v1/estoques
${param}          idcompanhia=21&skus=5082530&tiposEstoque=N&filiais=33041260119641&restricoes=WN


*** Test Cases ***

Caso de Teste Get Simples
    
    create session  mysession   ${base_url}

    ${response}=    get on session   mysession  ${endpoint}  ${param} 

    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

    ${body}=        convert to string  ${response.content}
    should contain  ${body}  "valido":true

    should be true  ${response.json()['valido']}

    log to console  Exibindo variaveis de retorno
    log to console  ${response.status_code}
    log to console  ${response.content}

    # ${campo_valido}=  Evaluate  ${response.json()['valido']}



    # ${json_object}=   to json   ${response.content}
    # ${campo_valido}=   get value from json  ${json_object}  $.Estoque.valido

    # log to console  Exibindo campo valido
    # log to console  ${campo_valido}
    # log to console  ${campo_valido[0]}
