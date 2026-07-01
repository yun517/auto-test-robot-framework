*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/add_remove_elements_keywords.robot

Test Setup       Open Browser To Page    ${add_remove_element_url}
Test Teardown    Close Browser

*** Test Cases **
能成功新增元素
    點擊新增元素按鈕
    驗證元素已新增

能成功刪除元素
    點擊新增元素按鈕
    點擊刪除元素按鈕
    驗證元素已刪除
