*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/basic_auth_keywords.robot

## 每個test case執行前都會執行的關鍵字
Test Setup       Open Browser To Page    ${basic_auth_url}
Test Teardown    Close Browser

*** Test Cases ***
驗證Basic Auth能夠成功登入
    頁面應該出現    Congratulations! You must have the proper credentials.