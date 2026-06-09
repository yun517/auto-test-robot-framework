*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
設定checkbox狀態
    [Arguments]    ${checkbox_number}    ${checked}
    ${locator}=    Set Variable    //form[@id='checkboxes']/input[${checkbox_number}]
    Wait Until Element Is Visible    ${locator}    100s    Cannot find checkbox ${checkbox_number}
    Run Keyword If    ${checked}    Select Checkbox     ${locator}
    ...    ELSE    Unselect Checkbox     ${locator}

檢查特定checkbox是否被勾選
    [Arguments]    ${checkbox_number}    ${iS_selected}
    ${locator}=    Set Variable    //form[@id='checkboxes']/input[${checkbox_number}]
    Run Keyword If    ${iS_selected}    Checkbox Should Be Selected    ${locator}
    ...    ELSE    Checkbox Should Not Be Selected    ${locator}