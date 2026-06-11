*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
逐一檢查圖片是否正常顯示
    Wait Until Element is Visible    //div[@id='content']//img[1]    timeout=10s
    ${count}=    Get Element Count    //div[@id='content']//img
    Log To Console    頁面上共有 ${count} 張圖片

    ${broken_images}=    Create List
    FOR    ${i}    IN RANGE    1    ${count + 1}
        ${attribute}=    Get Element Attribute    //div[@id='content']//img[${i}]    naturalWidth
        Log To Console    圖片 ${i} 的 naturalWidth 屬性值為: ${attribute}

        IF    '${attribute}'=='0'
            Append To List    ${broken_images}    ${i}
        END
    END
    
    Should Be Empty    ${broken_images}    以下圖片索引的圖片無法正常顯示: ${broken_images}