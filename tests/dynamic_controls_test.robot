*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/dynamic_controls_keywords.robot

Test Setup       Open Browser To Page    ${dynamic_controls_url}
Test Teardown    Close Browser

*** Test Cases **
Checkbox應可被移除
    點擊Checkbox
    點擊Remove按鈕
    驗證Checkbox已被移除

Remove 按鈕執行期間應顯示 loading icon
    點擊Checkbox
    點擊Remove按鈕
    驗證Loading Icon已顯示

Checkbox應可被新增
    點擊Checkbox
    點擊Remove按鈕
    點擊Add按鈕
    驗證Checkbox已被新增

Add 按鈕執行期間應顯示 loading icon
    點擊Checkbox
    點擊Remove按鈕
    點擊Add按鈕
    驗證Loading Icon已顯示

輸入框應可被啟用
    點擊Enable按鈕
    驗證輸入框是否被啟用    enabled

Enable 按鈕執行期間應顯示 loading icon
    點擊Enable按鈕
    驗證Loading Icon已顯示

啟用後應可輸入文字
    點擊Enable按鈕
    輸入文字到輸入框    test message
    驗證輸入框的文字為    test message

輸入框應可被停用
    點擊Enable按鈕
    點擊Disable按鈕
    驗證輸入框是否被啟用    disabled

Disable 按鈕執行期間應顯示 loading icon
    點擊Enable按鈕
    點擊Disable按鈕
    驗證Loading Icon已顯示

# 每次按按鈕動作都會留下紀錄，這個紀錄會在下一次按按鈕時不會被清除