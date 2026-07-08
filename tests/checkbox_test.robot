*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/checkbox_keywords.robot

Test Setup       開啟頁面    ${checkbox_url}
Test Teardown    Close Browser

*** Test Cases **
checkbox應能被勾選
    設定checkbox狀態    1    ${true}
    檢查特定checkbox是否被勾選    1    ${true}

checkbox應能被取消勾選
    設定checkbox狀態    1    ${true}
    設定checkbox狀態    1    ${false}
    檢查特定checkbox是否被勾選    1    ${false}