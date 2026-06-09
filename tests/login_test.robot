*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/login_keywords.robot
Resource          ../resources/variables.robot

## 每個test case執行前都會執行的關鍵字
Test Setup       Open Browser To Page    ${login_url}
Test Teardown    Close Browser

*** Test Cases ***
登入成功
    輸入帳密並登入    tomsmith    SuperSecretPassword!
    頁面應該出現    You logged into a secure area!

登入失敗
    輸入帳密並登入    tomsmith    錯誤密碼
    頁面應該出現    Your password is invalid!

