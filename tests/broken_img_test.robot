*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/broken_img_keywords.robot

Test Setup       Open Browser To Page    ${broken_img_url}
Test Teardown    Close Browser

*** Test Cases **
頁面圖片應全部正常顯示
    逐一檢查圖片是否正常顯示