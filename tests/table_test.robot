*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/table_keywords.robot
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot

Test Setup       開啟頁面    ${table_url}
Test Teardown    Close Browser

*** Test Cases **
列出特定欄位的資料
    抓取特定欄位的資料    2