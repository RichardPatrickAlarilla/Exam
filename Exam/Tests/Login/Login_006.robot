*** Settings ***
Library        SeleniumLibrary
Suite Setup    Open Browser    ${URL}    ${BROWSER}
Resource       ../../Resources/variables.robot

*** Keywords ***
Maximize
    Maximize Browser Window

Login
    Wait Until Element Is Visible    //*[@id="user-name"]                             5s
    Input Text                       //*[@id="user-name"]                             ${USERNAME6}
    Input Text                       //*[@id="password"]                              ${PASSWORD}
    Click Element                    //*[@id="login-button"]
    Wait Until Element Is Visible    //*[@id="header_container"]/div[1]/div[2]/div    5s

Verify Successful Login
    Wait Until Element Is Visible    //*[@id="header_container"]/div[1]/div[2]/div    5s
    Capture Page Screenshot
    Log To Console    "Login successful - user is on the dashboard."

Close
    Close Browser

*** Test Cases ***
Full Screen
    Maximize

Login and Verify
    Login
    Verify Successful Login

End
    Close