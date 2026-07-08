*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/drag_n_drop_keywords.robot

Test Setup       開啟頁面    ${drag_and_drop_url}
Test Teardown    Close Browser

*** Test Cases **
拖曳A到B後,兩者位置應交換
    拖曳A到B
    驗證A跟B位置已交換