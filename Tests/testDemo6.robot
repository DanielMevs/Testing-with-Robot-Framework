*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Library         Collections
Library         ../customLibraries/Shop.py
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        ../Resources/PO/Generic.robot
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/PO/ShopPage.robot

*** Variables ***
${Error_Message_Login}    class:alert-danger
@{listOfProducts}    Blackberry    Nokia Edge
*** Test Cases ***
#Validate Unsuccessful Login
#
#    Fill the login form   ${user_name}    ${invalid_password}
#    Wait until Element is visible on the page    ${Error_Message_Login}
#    Verify error message is correct

Validate Cards display in the Shopping Page
    LandingPage.Fill The Login Form    ${user_name}    ${valid_password}
    ShopPage.Wait until Element is visible on the page
    Verify Card titles in the Shop page
    Add Items To Cart And Checkout    ${listOfProducts}

#Select the Form and navigate to Child window
#    Fill The Login Details And Form





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
    Wait Until Element Is Visible    terms
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
