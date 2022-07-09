*** Settings ***

Library  RequestsLibrary
Library  Collections
Library  OperatingSystem
Library  JSONLibrary


*** Variables ***
${base_url}       http://hlg-oms-corporativo.api-cnova.com.br
${endpoint}       /inventario/v3/prazoemmassa
${bearerToken}    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.HEAFzxWNRFJeyY7PCPzhqtB0UX68R6__sfrxQccRaFs"

*** Test Cases ***

Caso de Teste POST
    
    create session  mysession   ${base_url}

    ${body_json}=  load json from file  post.txt 
    ${headers}      create dictionary   Authorization=${bearerToken}    Content-Type=application/json

    ${response}=    POST On Session  mysession  ${endpoint}  json=${body_json}   headers=${headers}

    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

    should be true  ${response.json()['valido']}

    should be equal as strings  ${response.json()['prazosEntrega'][0]['idFilial']}   228
    #${o_valido}=  get value from json  ${response.content}  $.valido 
    #should be true  ${o_valido}==True 
