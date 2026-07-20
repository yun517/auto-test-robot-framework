*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
滑鼠移至指定圖片上
    [Arguments]    ${index}
    ${locator}=    Set Variable    //div[@class="figure"][${index}]//img
    Wait Until Element Is Visible    ${locator}
    Mouse Over    ${locator}

驗證使用者資訊
    [Arguments]    ${index}
    ${user_name}=    Get Text    //div[@class="figure"][${index}]//h5
    Log To Console    user_name:${user_name}
    ${expected_text}=    Set Variable    name: user${index}
    Should Be Equal    ${user_name}    ${expected_text}

驗證個人頁面連結已顯示
    [Arguments]    ${index}
    Element Should Be Visible    //div[@class="figure"][${index}]//a
    Click Element    //div[@class="figure"][${index}]//a