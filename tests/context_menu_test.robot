*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/context_menu_keywords.robot

Test Setup       開啟頁面    ${context_menu_url}
Test Teardown    Close Browser

*** Test Cases **
當使用者於熱區點擊右鍵時應跳出正確的 Alert 訊息
    點擊熱區右鍵
    Alert 應包含文字    You selected a context menu