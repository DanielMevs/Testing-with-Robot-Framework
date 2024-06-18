*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Library         Collections
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}    class:alert-danger
${Shop_page_load}    css:.nav-link
*** Test Cases ***
#Validate Unsuccessful Login
#
#    Fill the login form   ${user_name}    ${invalid_password}
#    Wait until Element is visible on the page    ${Error_Message_Login}
#    Verify error message is correct

#Validate Cards display in the Shopping Page
#    Fill The Login Form    ${user_name}    ${valid_password}
#    Wait until Element is visible on the pagcfe    ${Shop_page_load}
#    Verify Card titles in the Shop page
#    Select the Card    Nokia Edge

Select the Form and navigate to Child window
    Fill The Login Details And Form

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
    
Verify Card titles in the Shop page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get WebElements    css:.card-title
    @{actualList}=    Create List    
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}


Select the Card
    [Arguments]    ${cardName}
    ${elements}=    Get Webelements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
            ${index}=  Evaluate    ${index} + 1
        
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button



Fill the Login Details and Form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Button    okayBtn
    Click Button    okayBtn
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
