*** Settings ***
#Resource  ../Tests/TC_API1.robot

Library  RequestsLibrary
Library  Collections
Library  OperatingSystem
Library  JSONLibrary

*** Variables ***
${base_url}       http://hlg-oms-corporativo.api-cnova.com.br
${endpoint}       /inventario/v3/prazoemmassa
${bearerToken}    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.HEAFzxWNRFJeyY7PCPzhqtB0UX68R6__sfrxQccRaFs"


*** Keywords ***
Dado que eu possua um SKU 

E que eu possua um CNPJ Filial

Quando eu acesso a api ConsultaPrazoEntrega

    create session  mysession   ${base_url}

    ${body_json}=   load json from file  post.txt 
    ${headers}      create dictionary   Authorization=${bearerToken}    Content-Type=application/json

    ${response}=    POST On Session  mysession  ${endpoint}  json=${body_json}   headers=${headers}
    Set Test Variable  ${response}

Entao a api finaliza com response
    [Arguments]  ${retcode}
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  ${retcode}

