*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
輸入帳密並登入
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    class=radius