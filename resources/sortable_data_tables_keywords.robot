*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
讀取特定列資料
    [Arguments]    ${table}    ${row}
    # SeleniumLibrary 的 Locator 支援：xpath, id, name, css
    # 沒加xpath，Get Element Count 把 Locator 當成其他類型解析
    ${count}=    Get Element Count    xpath=//table[@id="table${table}"]/tbody/tr[${row}]/td
    ${result}=    Create List
    FOR    ${i}    IN RANGE    1    ${count}
        ${text}=    Get Text    //table[@id="table${table}"]/tbody/tr[${row}]/td[${i}]
        Append To List    ${result}    ${text}
    END
    Log To Console    row ${row} = ${result}
    RETURN    ${result}

檢查列資料是否正確
    [Arguments]    ${row}    ${result}
    Lists Should Be Equal    ${expected_row_${row}}    ${result}

讀取特定欄位資料
    [Arguments]    ${table}    ${col_name}
    ${count}=    Get Element Count    //table[@id="table${table}"]/tbody/tr
    ${result}=    Create List
    
    # Table2 使用 class 定位，作為 XPath 練習
    IF    '${table}'=='1'
        ${index}=    Get From Dictionary    ${column_index}    ${col_name}
        FOR    ${i}    IN RANGE    1    ${count+1}
            ${text}=    Get Text    //table[@id="table${table}"]/tbody/tr[${i}]/td[${index}]
            Append To List    ${result}    ${text}
        END
    ELSE IF    '${table}'=='2'
        ${col_class}=    Get From Dictionary    ${header}    ${col_name}
        FOR    ${i}    IN RANGE    1    ${count+1}
            ${text}=    Get Text    //table[@id="table${table}"]/tbody/tr[${i}]/td[@class="${col_class}"]
            Append To List    ${result}    ${text}
        END
    END
    Log To Console    table data = ${result}
    RETURN    ${result}

提取expected data
    [Arguments]    ${col_name}
    ${index}=    Get From Dictionary    ${column_index}    ${col_name}
    ${index}=    Evaluate    ${index}-1
    ${expected_data}=    Create List

    FOR    ${i}    IN RANGE    0    4
        ${row}=    Get From List    ${expected_table}    ${i}
        ${text}=    Get From List    ${row}    ${index}
        Append To List    ${expected_data}    ${text}
    END

    RETURN    ${expected_data}

檢查欄位資料是否正確
    [Arguments]    ${col_name}    ${result}
    ${expected_data}=    提取expected data    ${col_name}
    Lists Should Be Equal    ${expected_data}    ${result}

選擇排序方式
    [Arguments]    ${table}    ${isAscending}    ${col_name}
    ${index}=    Get From Dictionary    ${column_index}    ${col_name}
    Log To Console    index = ${index}
    ${locator}=    Set Variable    //table[@id="table${table}"]/thead/tr/th[${index}]
    Wait And Click Element    ${locator}
    IF    not ${isAscending}    Click Element    ${locator}
    
檢查排序是否正確
    [Arguments]    ${col_name}    ${isAscending}    ${result}
    ${expected_data}=    提取expected data    ${col_name}
    Sort List    ${expected_data}
    IF    not ${isAscending}    Reverse List    ${expected_data}
    Log To Console    expected data = ${expected_data}
    Lists Should Be Equal    ${expected_data}    ${result}