*** Settings ***
Library    Selenium2Library
Library    String

*** Variables ***
${LOG_IN_BUTTON}         id=h_usr-link
${LOG_USER}              id=h_usr-signin
${EMAIL_TEXTBOX}         id=email-input
${PASSWORD_TEXTBOX}      id=password-input
${AUTH_USER_BUTTON}      id=login-button
${SEARCH_BAR}            id=h_search-input
${PRODUCT_SEARCH_BAR}    //a[contains(@class, 'as-lnk') and contains(@title, '$$')]
${BUY_BUTTON}            id=btn-buy
${CONTINUE_TO_CART}      id=btn-continue
${GO_TO_PAYMENT}         id=buy-button
${USE_CREDIT_CARD}       //li[contains(@id, 'payment-option-menu-CREDIT_CARD')]//span[contains(@class, 'btn')]
${ENTER_CART}            id=h_minicart
${OPEN_CART}             css=.crt-basquet
${REMOVE_FILE_CART}      //a[contains(@title, '$$')]/ancestor::ul[contains(@class, 'basket-item-wrapper')]/descendant::li[contains(@class, 'item--remove hidden-xs')]
${PRODUCT_QUANTITY}      //a[contains(@title, '$$')]/ancestor::ul[contains(@class, 'basket-item-wrapper')]/descendant::option[contains(@value, 'qtd')]
${HOME_BUTTON}           id=brand-navbar

*** Keywords ***
Open Browser At E-commerce
    #${CAPABILITIES}=    Return Chrome Options As Capabilities    
    Open Browser    url=${URL}    browser=googlechrome    remote_url=http://localhost:4444/wd/hub
    Maximize Browser Window
    Waits And Focus Element    ${LOG_IN_BUTTON}    10s

Tests Teardown
    Close Browser

Scroll Page To Location
    [Arguments]   ${x_location}    ${y_location}
    Execute Javascript    window.scrollTo(${x_location}, ${y_location})

Waits And Focus Element
    [Arguments]    ${locator}    ${time}=10s
    Wait Until Page Contains Element    ${locator}    ${time}
    Wait Until Element Is Visible    ${locator}    ${time}
    Mouse Over    ${locator}

Click If Element Is Visible
    [Arguments]    ${locator}    ${time}=10s
    Waits And Focus Element    ${locator}    ${time}
    Wait Until Keyword Succeeds    3x    0.4s    Click Element    ${locator}

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
        
Type Product on Search Bar
    [Arguments]    ${text}
    Click If Element Is Visible    ${SEARCH_BAR}
    Input Text If Visible    ${SEARCH_BAR}    ${text}

Click on Product With Specific Name
    [Arguments]    ${product_name}
    ${locator}=    Replace String    ${PRODUCT_SEARCH_BAR}    $$    ${product_name}
    Click If Element Is Visible   ${locator} 

Click Buy Button
    Click If Element Is Visible    ${BUY_BUTTON}

Click Continue To Cart Button
    Click If Element Is Visible    ${CONTINUE_TO_CART}

Go To Checkout
    # waits for delivery tax calculation
    Sleep   5s
    Click If Element Is Visible   ${GO_TO_PAYMENT}

Use Credit Card as Payment
    # waits for delivery tax calculation
    Sleep   10s
    Click If Element Is Visible    ${USE_CREDIT_CARD}
    
    # let user see credit card info
    Sleep    2s

Remove Product From Cart
    [Arguments]    ${product_name}
    Wait Until Keyword Succeeds   3x    0.3s    Go To    ${URL}

    Click If Element Is Visible   ${ENTER_CART}
    Click If Element Is Visible   ${OPEN_CART}


    ${locator}=    Replace String   ${REMOVE_FILE_CART}    $$    ${product_name} 
    Click If Element Is Visible     ${locator}
    Wait Until Element Is Not Visible    ${locator}

Increase quantity
    [Arguments]    ${product_name}    ${qtd}
    
    ${first}=    Replace String    ${PRODUCT_QUANTITY}     $$    ${product_name}
    ${locator}=    Replace String    ${first}    qtd    ${qtd}
    Click If Element Is Visible    ${locator}
