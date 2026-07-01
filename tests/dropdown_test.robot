*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/dropdown_keywords.robot

Test Setup       Open Browser To Page    ${dropdown_url}
Test Teardown    Close Browser

*** Test Cases **
驗證下拉選單能夠選擇選項
    選擇下拉選單選項    Option 1
    驗證下拉選單選項被選擇    Option 1

驗證下拉選單能夠選擇另一個選項
    選擇下拉選單選項    Option 1
    選擇下拉選單選項    Option 2
    驗證下拉選單選項被選擇    Option 2