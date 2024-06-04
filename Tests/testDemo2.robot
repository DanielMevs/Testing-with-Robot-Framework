*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}    class:alert-danger

*** Test Cases ***
Validate Unsuccessful Login
    
    Fill the login form
    Wait until it checks and display error message
    Verify error message is correct

*** Keywords ***

    
Fill the login form
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${invalid_password}
    Click Button      signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
#    ${result}=    Get Text    ${Error_Message_Login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Sleep    4s
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

