*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_name}    RobotFramework

*** Test Cases ***
Play around with Dictionaries
    [Tags]    API
    &{data}=    Create Dictionary    name=rahulshetty    course=robot    website=rahulshettyacademy.com
    Log To Console    ${data}
    Dictionary Should Contain Key    ${data}    name
    Log To Console      ${data}[name]
    Get From Dictionary    ${data}    website
    ${url}=    Get From Dictionary    ${data}    website
    Log To Console    ${url}

Add Book into Library DataBase
    [Tags]    API
    &{req_body}=    Create Dictionary    book_name=${book_name}    isbn=943203    aisle=32453    author=rahulshetty
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_id}
    Log To Console    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200    ${response}


Get the Book Details which got added
    [Tags]    API
    ${get_response}=    GET    ${base_url}/Library/GetBook.php    params=ID=94320332453    expected_status=200
    Log    ${get_response.json()}    console=True
    Should Be Equal As Strings    ${book_name}    ${get_response.json()}[0][book_name]


Delete the Book from database
    &{delete_req}=    Create Dictionary    ID=${book_id}
    ${delete_resp}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_req}    expected_status=200
    Log    ${delete_resp.json()}
    Should Be Equal As Strings    book is successfully deleted    ${delete_resp.json()}[msg]
    
    
    
    
