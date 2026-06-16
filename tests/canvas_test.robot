*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/canvas_keywords.robot

Test Setup       Open Browser To Page    ${challenging_dom_url}
Test Teardown    Close Browser

*** Test Cases **
Canvas 應顯示數字
    讀取 Canvas 圖片上的數字