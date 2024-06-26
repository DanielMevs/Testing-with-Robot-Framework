*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Library         String
Library         Collections
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser
Resource        ../Resources/PO/Generic.robot

*** Variables ***
${Error_Message_Login}    class:alert-danger

*** Test Cases ***
Validate Child Window Functionality
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
    Wait Until Element Is Visible    css:.blinkingText
    Click Element    css:.blinkingText
    Sleep    5
    
Verify the user is Switched to Child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    @{final_split}=    Split String    ${text_split}
    ${email}=    Get From List    ${final_split}    0
#    log     ${email_id}
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
#    Sleep    3