*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
點擊 Click Here
    Wait And Click Element    //a[text()='Click Here']

驗證視窗數量
    [Arguments]    ${expected_count}
    ${window_handles}=    Get Window Handles
    ${count}=    Get Length    ${window_handles}
    Should Be Equal As Integers    ${count}    ${expected_count}

切換至指定視窗
    [Arguments]    ${window_index}
    Switch Window    ${window_index}

驗證頁面文字
    [Arguments]    ${expected_text}
    Element Text Should Be    //h3    ${expected_text}    頁面沒有出現文字：${expected_text}