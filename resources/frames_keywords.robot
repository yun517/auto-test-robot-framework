*** Settings ***
Library    SeleniumLibrary
Library           String

*** Keywords ***
切換至指定Frame
    [Arguments]    ${which_frame}
    Select Frame    frame-${which_frame}

返回主畫面
    Unselect Frame

驗證 Frame 文字為
    [Arguments]    ${expected_text}
    Current Frame Should Contain    ${expected_text}
