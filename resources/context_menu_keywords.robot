*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
點擊熱區右鍵
    Wait Until Element Is Enabled    //div[@id="hot-spot"]
    Open Context Menu    //div[@id="hot-spot"]

Alert 應包含文字
    [Arguments]    ${expected_text}
    Alert Should Be Present    ${expected_text}