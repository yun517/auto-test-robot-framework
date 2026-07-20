*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common_keywords.robot
Resource          ../resources/variables.robot
Resource          ../resources/sortable_data_tables_keywords.robot

Test Setup       開啟頁面    ${sortable_data_tables_url}
Test Teardown    Close Browser

*** Variables ***
&{header}=    Last Name=last-name    First Name=first-name    Email=email    Due=dues    Web Site=web-site
&{column_index}=    Last Name=1    First Name=2    Email=3    Due=4    Web Site=5

@{expected_row_1}    Smith     John     jsmith@gmail.com        $50.00    http://www.jsmith.com
@{expected_row_2}    Bach      Frank    fbach@yahoo.com         $51.00    http://www.frank.com
@{expected_row_3}    Doe       Jason    jdoe@hotmail.com        $100.00   http://www.jdoe.com
@{expected_row_4}    Conway    Tim      tconway@earthlink.net    $50.00    http://www.timconway.com
@{expected_table}    ${expected_row_1}    ${expected_row_2}    ${expected_row_3}    ${expected_row_4}

*** Test Cases **
Table1應可取得指定列資料
    ${result}=    讀取特定列資料    1    1
    檢查列資料是否正確    1    ${result}

Table2應可取得指定列資料
    ${result}=    讀取特定列資料    2    1
    檢查列資料是否正確    1    ${result}

Table1應可取得指定欄位資料
    ${result}=    讀取特定欄位資料    1    Email
    檢查欄位資料是否正確    Email    ${result}

Table2應可取得指定欄位資料
    ${result}=    讀取特定欄位資料    2    Email
    檢查欄位資料是否正確    Email    ${result}

Table1資料應照順序排列
    選擇排序方式    1    True    Email
    ${result}=    讀取特定欄位資料    1    Email
    檢查排序是否正確    Email    True    ${result}

Table2資料應照順序排列
    選擇排序方式    2    False    Email
    ${result}=    讀取特定欄位資料    2    Email
    檢查排序是否正確    Email    False    ${result}