*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
開啟頁面
    [Arguments]    ${url}
    Open Browser    ${url}    ${browser}    
    Maximize Browser Window
    Set Selenium Speed    0.3s

Wait Until Page Contains Text
    [Arguments]    ${expected}
    Wait Until Page Contains    ${expected}    5s    頁面未出現預期文字: ${expected}

Wait And Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Enabled    ${locator}    30s    元素沒有在30秒內啟用
    Click Element    ${locator}

Wait Until Element Is Disabled
    [Arguments]    ${locator}    ${timeout}=10s    ${error}=元素未在指定時間內被禁用
    Wait Until Keyword Succeeds    ${timeout}    1s    Element Should Be Disabled    ${locator}