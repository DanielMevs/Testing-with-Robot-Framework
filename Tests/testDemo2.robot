*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}    class:alert-danger
${Shop_page_load}    css:.nav-link
*** Test Cases ***
Validate Unsuccessful Login
    
    Fill the login form   ${user_name}    ${invalid_password}
    Wait until Element is visible on the page    ${Error_Message_Login}
    Verify error message is correct

Validate Cards display in the Shopping Page
    Fill The Login Form    ${user_name}    ${valid_password}
    Wait until Element is visible on the page    ${Shop_page_load}

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn

Wait until Element is visible on the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message is correct
#    ${result}=    Get Text    ${Error_Message_Login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Sleep    4s
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

