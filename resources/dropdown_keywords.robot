*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
選擇下拉選單選項
    [Arguments]    ${option}
    Wait And Click Element    //select[@id='dropdown']
    Click Element    //select[@id='dropdown']/option[text()='${option}']

驗證下拉選單選項被選擇
    [Arguments]    ${option}
    ${selected_option}=    Get Selected List Label    id=dropdown
    Log To Console    選擇的選項是: ${selected_option}
    Should Be Equal    ${selected_option}    ${option}