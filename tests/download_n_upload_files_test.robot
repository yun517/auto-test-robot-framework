*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/download_n_upload_files_keywords.robot

Test Teardown    Close Browser

*** Variables ***
${download_file_name}=    some-file.txt

*** Test Cases **
檔案應可下載
    開啟下載頁面並初始化資料夾
    下載指定檔案    ${download_file_name}
    檢查檔案是否存在於下載資料夾    ${download_file_name}

檔案應可上傳
    開啟頁面    ${file_upload_url}
    上傳檔案    upload_testing_file.txt
    檢查檔案是否成功上傳    upload_testing_file.txt