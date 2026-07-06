*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Page
    [Arguments]    ${url}
    Open Browser    ${url}    ${browser}    
    Maximize Browser Window
    Set Selenium Speed    0.3s

Wait Until Page Contains Text
    [Arguments]    ${expected}
    Wait Until Page Contains    ${expected}    timeout=5s    error=頁面未出現預期文字: ${expected}

Wait And Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}

Wait Until Element Is Disabled
    [Arguments]    ${locator}    ${timeout}=10s    ${error}=Element did not become disabled within the timeout
    Wait Until Keyword Succeeds    ${timeout}    1s    Element Should Be Disabled    ${locator}