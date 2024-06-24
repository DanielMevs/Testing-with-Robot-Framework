*** Settings ***
Documentation    All the page objects and keywords of the landing page
Library          SeleniumLibrary
Resource         Generic.robot

*** Variables ***
${Error_Message_Login}    class:alert-danger

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id:username
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn


Wait until Element is visible on the page
    Wait Until element passed is located on Page    ${Error_Message_Login}


Verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.


Fill the Login Details and Form
    Wait Until Element Is Visible    id:username
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Wait Until Element Is Visible    okayBtn
    Click Button    okayBtn
    Sleep    5s
    Click Button    okayBtn
    Sleep    5s
    Select From List By Value    css:select.form-control    teach
    Wait Until Element Is Visible    terms
    Select Checkbox    terms
    Checkbox Should Be Selected    terms