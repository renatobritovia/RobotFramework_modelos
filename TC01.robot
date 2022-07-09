*** Settings ***

Library  RequestsLibrary

*** Variables ***

${base_url}     https://api.onlinewebtutorblog.com/
${endpoint}     /employees

*** Test Case ***

Chamada_API

    create session      MinhaSessao     ${base_url}

    ${response}=        get on session  MinhaSessao     ${endpoint}

    log to console      ${response}
