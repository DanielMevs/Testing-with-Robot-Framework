*** Settings ***
Documentation    To validate Login form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}    class:alert-danger

*** Test Cases ***
Validate Unsuccessful Login
    open the browser with the Mortgage payment url
    Fill the login form
    Wait until it checks and display error message
    Verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
    Sleep    2s
    
Fill the login form
    Input Text        id:username    raulshettyacademy
    Input Password    id:password    12345678
    Click Button      signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
#    ${result}=    Get Text    ${Error_Message_Login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Sleep    4s
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

