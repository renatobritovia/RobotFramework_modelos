*** Settings ***
Resource  ../Steps/steps_API.resource

Library  RequestsLibrary
Library  Collections
Library  OperatingSystem
Library  JSONLibrary

*** Variables ***


*** Keywords ***


*** Test Cases ***
TC01 - Consultar Prazo Entrega de Mercadoria
    Dado que eu possua um SKU  9999
    E que eu possua um CNPJ Filial  7777
    Quando eu acesso a api ConsultaPrazoEntrega
    Entao a api finaliza com response  200

