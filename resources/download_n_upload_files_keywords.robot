*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${download_dir}         ${EXECDIR}${/}downloads

*** Keywords ***
開啟下載頁面並初始化資料夾
    Create Directory     ${download_dir}
    Empty Directory      ${download_dir}

    # 建立 Chrome 的偏好設定 (Prefs)
    ${prefs}=    Create Dictionary    
    ...    download.default_directory=${download_dir}    # 指定下載路徑
    ...    download.prompt_for_download=${False}         # 強制關閉「另存新檔」提示視窗
    ...    download.directory_upgrade=${True}
    ...    safebrowsing.enabled=${True}

    # 將 Prefs 塞入 Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    # 帶上這些設定開啟瀏覽器
    Open Browser    ${file_download_url}    chrome    options=${options}

下載指定檔案
    [Arguments]    ${file_name}
    Wait And Click Element    //a[text()='${file_name}']

檢查檔案是否存在於下載資料夾
    [Arguments]    ${file_name}
    ${file_path}=    Set Variable    ${download_dir}${/}${file_name}
    Wait Until Keyword Succeeds    10s    1s    File Should Exist    ${file_path}
    ${size}=    Get File Size    ${file_path}
    Should Be True    ${size} > 0    錯誤：${file_name} 的檔案大小為 0，下載失敗

上傳檔案
    [Arguments]    ${file_name}
    ${upload_file_path}=    Set Variable    ${EXECDIR}${/}upload${/}${file_name}
    Choose File    id=file-upload    ${upload_file_path}
    Click Button    //input[@id="file-submit"]

檢查檔案是否成功上傳
    [Arguments]    ${file_name}
    Wait Until Page Contains Text    File Uploaded!
    Wait Until Page Contains Text    ${file_name}