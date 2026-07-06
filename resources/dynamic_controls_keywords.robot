*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
點擊Checkbox
    Wait And Click Element    //div[@id="checkbox"]/input

點擊Remove按鈕
    Click Button    //button[text()="Remove"]

驗證Checkbox已被移除
    Wait Until Element Is Not Visible    //div[@id="loading"]    30s    error=loading 超過30秒鐘
    Element Should Not Be Visible    //div[@id="checkbox"]
    Wait Until Page Contains Text    It's gone!

驗證Loading Icon已顯示
    Wait Until Element Is Visible    //div[@id="loading"]    10s    error=未顯示loading icon

點擊Add按鈕
    Wait And Click Element    //button[text()="Add"]

驗證Checkbox已被新增
    Wait Until Element Is Not Visible    //div[@id="loading"]    30s    error=loading 超過30秒鐘
    Wait Until Element Is Visible    //input[@id="checkbox"]    10s    error=checkbox未新增
    Wait Until Page Contains Text    It's back!

點擊Enable按鈕
    Wait And Click Element    //button[text()="Enable"]

驗證輸入框是否被啟用
    [Arguments]    ${expected_status}
    IF    '${expected_status}'=='enabled'
        Wait Until Element Is Enabled    //input[@type="text"]    10s    error=輸入框未在10秒內啟用
    ELSE IF    '${expected_status}'=='disabled'
        Wait Until Element Is Disabled    //input[@type="text"]    10s    error=輸入框未在10秒內停用
    ELSE
        Fail    無效的狀態: ${expected_status}
    END

輸入文字到輸入框
    [Arguments]    ${text}
    Wait Until Element Is Enabled    //input[@type="text"]    15s    error=輸入框未啟用
    Input Text    //input[@type="text"]    ${text}

驗證輸入框的文字為
    [Arguments]    ${expected_text}
    Sleep    1s
    ${actual_text}=    Get Value    //input[@type="text"]
    Run Keyword If    '${expected_text}'!='${actual_text}'    Fail    輸入框的文字不符合預期，預期: ${expected_text}，實際: ${actual_text}

點擊Disable按鈕
    Wait And Click Element    //button[text()="Disable"]