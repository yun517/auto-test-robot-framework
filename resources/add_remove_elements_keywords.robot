*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
點擊新增元素按鈕
    Wait Until Element Is Enabled    //button[text()='Add Element']    5s    error=頁面未出現新增按鈕
    Click Element    //button[text()='Add Element']

點擊刪除元素按鈕
    Wait Until Element Is Enabled    //button[text()='Delete']    5s    error=頁面未出現刪除按鈕
    Click Element    //button[text()='Delete']

驗證元素已新增
    Wait Until Element Is Visible    //button[text()='Delete']    5s    error=元素未新增

驗證元素已刪除
    Wait Until Element Is Not Visible    //button[text()='Delete']    5s    error=元素未刪除