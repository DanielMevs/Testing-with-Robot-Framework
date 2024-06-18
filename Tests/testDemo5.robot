*** Settings ***
Documentation    To validate Login form
Library    SeleniumLibrary
Library    DataDriver    file=resources/data.csv    dialect=excel    encoding=utf_8
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login

*** Variables ***
${Error_Message_Login}    class:alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}    xyc    123456
    

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    Fill the login form    ${username}    ${password}
    Wait until it checks and display error message
    Verify error message is correct

open the browser with the Mortgage payment url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
    Sleep    2s

Fill the login form
    [Arguments]       ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
#    ${result}=    Get Text    ${Error_Message_Login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
#    Sleep    4s
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

