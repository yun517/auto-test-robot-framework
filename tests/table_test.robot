*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/table_keywords.robot
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot

Test Setup       Open Browser To Page    ${Table URL}
Test Teardown    Close Browser

*** Test Cases **
列出特定欄位的資料
    抓取特定欄位的資料    2