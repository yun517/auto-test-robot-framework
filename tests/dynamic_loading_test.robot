*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/dynamic_loading_keywords.robot

Test Teardown    Close Browser

*** Test Cases **
Example1 應於載入完成後顯示 Hello World
    開啟頁面    ${dynamic_loading_url}/1
    點擊Start按鈕
    檢查是否Loading Icon已顯示
    檢查是否顯示Hello World

Example2 應於載入完成後顯示 Hello World
    開啟頁面    ${dynamic_loading_url}/2
    點擊Start按鈕
    檢查是否Loading Icon已顯示
    檢查是否顯示Hello World