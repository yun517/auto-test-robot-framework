*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
點擊Start按鈕
    Wait And Click Element    //div[@id='start']/button

檢查是否顯示Hello World
    Wait Until Element Is Not Visible    //div[@id='loading']    20s    loading icon沒有在20秒內消失
    Wait Until Element Is Visible    //div[@id='finish']/h4[text()='Hello World!']    20s    Hello World沒有在20秒內出現

檢查是否Loading Icon已顯示
    Wait Until Element Is Visible    //div[@id='loading']    20s    loading icon沒有在20秒內出現
    Wait Until Element Is Not Visible    //div[@id='loading']    20s    loading icon沒有在20秒內消失