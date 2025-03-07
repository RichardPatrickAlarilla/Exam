*** Settings ***
Library        SeleniumLibrary
Resource       ../../Resources/variables.robot
Suite Setup    Open Browser    ${URL}    ${BROWSER}

*** Keywords ***
Maximize
    Maximize Browser Window

Attempt Invalid Login
    Input Text    //*[@id="user-name"]    invalid_user
    Input Text    //*[@id="password"]    invalid_password
    Click Element    //*[@id="login-button"]
    Wait Until Element Is Visible    //*[@id="login_button_container"]/div/form/div[3]/h3    50s
    Capture Page Screenshot
    Log to console    "Invalid login"

Verify Login Failed
    Element Should Be Visible    //*[@id="login_button_container"]/div/form/div[3]/h3
    Log to console    "Login failed"

Close
    Close Browser

*** Test Cases ***
Invalid Login
    Attempt Invalid Login
    Verify Login Failed
    Close