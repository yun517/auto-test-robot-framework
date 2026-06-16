*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
讀取 Canvas 圖片上的數字
    Wait Until Page Contains Element    //canvas

    # Canvas 圖片上的數字是由 JavaScript 動態生成的，無法直接從 DOM 中獲取。
    # 執行 JavaScript 來獲取頁面上所有 <script> 標籤的內容，然後從中提取出包含 "Answer:" 的行。
    ${script_content}=    Execute Javascript    return Array.from(document.querySelectorAll('script')).map(s => s.textContent).join('\\n')
    ${ans_line}=    Get Lines Matching Regexp    ${script_content}    .*Answer:.*
    
    # 從包含 "Answer:" 的行中提取出數字部分，並驗證它是五位數。
    # 去除左半邊和右半邊的文字，留下中間的數字。
    ${temp}=    Fetch From Right    ${ans_line}    Answer:\
    ${num}=    Fetch From Left    ${temp}    '

    # 去除前後的空白字符，確保只剩下數字部分。
    ${ans}=    Strip String    ${num}
     Log To Console    Canvas 圖片上的數字：${ans}
    Should Match Regexp    ${ans}    ^\\d{5}$