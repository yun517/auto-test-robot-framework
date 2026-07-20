*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/multiple_windows_keywords.robot

Test Setup       開啟頁面    ${multiple_windows_url}
Test Teardown    Close Browser

*** Test Cases **
點擊連結後應開啟新視窗
    點擊 Click Here
    驗證視窗數量    2
    切換至指定視窗    NEW
    驗證頁面文字    New Window

應可返回原視窗
    點擊 Click Here
    切換至指定視窗    NEW
    切換至指定視窗    MAIN
    驗證頁面文字    Opening a new window