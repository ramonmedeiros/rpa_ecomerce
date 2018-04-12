*** Settings ***
Library    Selenium2Library


*** Variables ***
${LOG_IN_BUTTON}         id=h_usr-link
${LOG_USER}              id=h_usr-signin
${EMAIL_TEXTBOX}         id=email-input
${PASSWORD_TEXTBOX}      id=password-input
${AUTH_USER_BUTTON}      id=login-button

*** Keywords ***
Open Browser At E-commerce
    #${CAPABILITIES}=    Return Chrome Options As Capabilities    
    Open Browser    url=${URL}    browser=googlechrome    remote_url=http://localhost:4444/wd/hub
    Wait Until Element Is Visible    ${LOG_IN_BUTTON}    10s

Tests Teardown
    Close Browser

Waits And Focus Element
    [Arguments]    ${locator}    ${time}=10s
    Wait Until Element Is Visible    ${locator}    ${time}
    Mouse Over    ${locator}

Click If Element Is Visible
    [Arguments]    ${locator}    ${time}=10s
    Waits And Focus Element    ${locator}    ${time}
    Click Element    ${locator}

Input Text If Visible
    [Arguments]    ${locator}    ${text}    ${time}=10s
    Waits And Focus Element    ${locator}    ${time}
    Input Text    ${locator}    ${text}

Login User
    [Arguments]    ${user}    ${password}
    Click If Element Is Visible   ${LOG_IN_BUTTON}
    Click If Element Is Visible   ${LOG_USER}

    Input Text If Visible    ${EMAIL_TEXTBOX}    text=${user}
    Input Text If Visible    ${PASSWORD_TEXTBOX}    text=${password}

    Click If Element Is Visible    ${AUTH_USER_BUTTON}
        
