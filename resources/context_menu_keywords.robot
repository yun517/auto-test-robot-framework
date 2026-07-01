*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
點擊熱區右鍵
    Wait Until Element Is Enabled    //div[@id="hot-spot"]
    Open Context Menu    //div[@id="hot-spot"]

Alert 應包含文字
    [Arguments]    ${expected_text}
    ${is_present}=    Run Keyword And Return Status    Alert Should Be Present    ${expected_text}
    Run Keyword If    not ${is_present}    Fail    Alert 未出現預期文字: ${expected_text}