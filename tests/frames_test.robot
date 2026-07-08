*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/frames_keywords.robot

Test Teardown    Close Browser

*** Test Cases **
Top Frames 應顯示正確內容
    開啟頁面    ${nested_frames_url}
    切換至指定Frame    top
    切換至指定Frame    left
    驗證 Frame 文字為    LEFT
    返回主畫面

    切換至指定Frame    top
    切換至指定Frame    middle
    驗證 Frame 文字為    MIDDLE
    返回主畫面

    切換至指定Frame    top
    切換至指定Frame    right
    驗證 Frame 文字為    RIGHT

Bottom Frame 應顯示正確內容
    開啟頁面    ${nested_frames_url}
    切換至指定Frame    bottom
    驗證 Frame 文字為    BOTTOM
# TinyMCE 的免費額度已用完。編輯器被設成 read-only。故跳過iframe測試