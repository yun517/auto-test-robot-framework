*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/basic_auth_keywords.robot

# 每個test case執行前都會執行的關鍵字
Test Setup       開啟頁面    ${basic_auth_url}
Test Teardown    Close Browser

*** Test Cases ***
應能夠成功登入
    Wait Until Page Contains Text    Congratulations! You must have the proper credentials.