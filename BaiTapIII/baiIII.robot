*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}     Chrome

${VALID_USER}      Admin
${VALID_PASS}      admin123

${INVALID_USER}    wronguser
${INVALID_PASS}    wrongpass

*** Test Cases ***
Login Test Flow
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@name='username']    timeout=10s
    Input Text    //input[@name='username']    ${VALID_USER}
    Input Text    //input[@name='password']    ${VALID_PASS}
    Click Element    //button[@type='submit']
    Wait Until Location Contains    /dashboard    timeout=10s
    Wait Until Page Contains    Dashboard    timeout=10s
    Sleep    10s
    Close Browser

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@name='username']    timeout=10s
    Input Text    //input[@name='username']    ${INVALID_USER}
    Input Text    //input[@name='password']    ${INVALID_PASS}
    Click Element    //button[@type='submit']
    Wait Until Page Contains    Invalid credentials    timeout=10s
