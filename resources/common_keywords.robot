*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Page
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}    
    Maximize Browser Window
    Set Selenium Speed    0.3s

頁面應該出現
    [Arguments]    ${expected}
    Wait Until Page Contains    ${expected}    timeout=5s