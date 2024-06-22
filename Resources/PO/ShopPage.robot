*** Settings ***
Documentation    All the page objects and keywords of the landing page
Library          SeleniumLibrary


*** Variables ***
${Shop_page_load}    css:.nav-link


*** Keywords ***
Wait until Element is visible on the page
    Wait Until Element Is Visible    ${Shop_page_load}