*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/login_keywords.robot
Resource          ../resources/variables.robot

## 每個test case執行前都會執行的關鍵字
Test Setup       Open Browser To Page    ${login_url}
Test Teardown    Close Browser

*** Test Cases ***
應能夠登入
    輸入帳密並登入    tomsmith    SuperSecretPassword!
    Wait Until Page Contains Text    You logged into a secure area!

應登入失敗
    輸入帳密並登入    tomsmith    錯誤密碼
    Wait Until Page Contains Text    Your password is invalid!

