*** Settings ***
Documentation    All the page objects and keywords of the landing page
Library          SeleniumLibrary
Resource         Generic.robot

*** Variables ***
${Shop_page_load}    css:.nav-link
${country_location}    //a[text()='United States of America']

*** Keywords ***

Enter the Country and select the terms
    [Arguments]    ${country_name}
    Input Text    country    ${country_name}
    Sleep    8s
    Wait Until element passed is located on Page    //a[text()='${country_name}']
    Click Element    //a[text()='${country_name}']

    Click Element    css:.checkbox label

Purchase the Product and Confirm the Purchase
    Click Button    css:.btn-success
    Page Should Contain    Success!