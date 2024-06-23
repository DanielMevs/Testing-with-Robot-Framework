*** Settings ***
Documentation    All the page objects and keywords of the landing page
Library          SeleniumLibrary
Resource         Generic.robot

*** Variables ***
${Shop_page_load}    css:.nav-link


*** Keywords ***

Verify items in the Checkout Page and Proceed
    Click Element    css:.btn-success
