*** Settings ***
Library    SeleniumLibrary


*** Keywords ***

抓取特定欄位的資料
    [Arguments]    ${column}
    Wait Until Element Is Visible    //table/tbody/tr[1]/td[1]    timeout=10s

    # 檢查欄位數量合法性
    ${columncount}=    Get Element Count    //table/thead/tr/th
    ${column_count}=    Convert To Integer    ${column_count}
    ${column}=    Convert To Integer    ${column}
    Run Keyword If    ${column} > ${column_count} or ${column} < 1    Fail    Invalid column number: ${column}

    # 取得列數並開始抓取資料
    ${row_count}=   Get Element Count    //table/tbody/tr
    FOR    ${row}    IN RANGE    1    ${row_count + 1}
        ${data}=    Get Text    //table/tbody/tr[${row}]/td[${column}]
        Log To Console    Row ${row} Column ${column}: ${data}
    END