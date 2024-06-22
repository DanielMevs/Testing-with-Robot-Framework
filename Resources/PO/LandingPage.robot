*** Settings ***
Documentation    All the page objects and keywords of the landing page
Library          SeleniumLibrary

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn