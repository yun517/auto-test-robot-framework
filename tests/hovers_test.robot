*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/hovers_keywords.robot

Test Setup       開啟頁面    ${hovers_url}
Test Teardown    Close Browser

*** Test Cases **
滑鼠hover在第一張圖上應顯示正確資訊
    滑鼠移至指定圖片上    1
    驗證使用者資訊    1
    驗證個人頁面連結已顯示    1

滑鼠hover在第三張照片上應顯示正確資訊
    滑鼠移至指定圖片上    3
    驗證使用者資訊    3
    驗證個人頁面連結已顯示    3
