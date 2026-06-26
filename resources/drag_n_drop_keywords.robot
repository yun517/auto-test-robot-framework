*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
拖曳A到B
    Wait Until Element Is Enabled    //div[@id='column-a']
    Drag And Drop    id=column-a    id=column-b

驗證A跟B位置已交換
    ${a_text}=    Get Element Attribute    id=column-a    textContent
    Log To Console    A的文字為: ${a_text}
    Run Keyword If    '${a_text}' == 'B'    Log To Console    A跟B位置已交換
    ...    ELSE IF    '${a_text}' == 'A'    Fail    A跟B位置未交換
    ...    ELSE    Fail    A的文字為: ${a_text}，不符合預期