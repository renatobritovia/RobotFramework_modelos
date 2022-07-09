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

Caso de Teste Post 

    # carrega body/json de arquivo
    ${json_obj}=  load json from file  post.txt 

    # identifica variavel dentro de json e consiste
    ${sku}=  get value from json  ${json_obj}  $.IdSku 
    ${s_sku}=  convert to string  ${sku[0]}
    
    should be true  ${s_sku}==7313

    should be equal  ${s_sku}  7313

    should contain  ${s_sku}  7313
