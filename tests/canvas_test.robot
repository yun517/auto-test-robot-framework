*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/canvas_keywords.robot

Test Setup       開啟頁面    ${challenging_dom_url}
Test Teardown    Close Browser

*** Test Cases **
Canvas 應顯示數字
    ${canvas_num}=    讀取 Canvas 圖片上的數字
    檢查是否為五位數    ${canvas_num}