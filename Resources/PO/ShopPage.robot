*** Settings ***
Documentation    All the page objects and keywords of the landing page
Library          SeleniumLibrary
Resource         Generic.robot

*** Variables ***
${Shop_page_load}    css:.nav-link


*** Keywords ***

Wait until Element is visible on the page
    Wait Until element passed is located on Page    ${Shop_page_load}


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