*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...              The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library          SeleniumLibrary
Library          OperatingSystem


*** Variables ***
${user_name}            raulshettyacademy
${invalid_password}     123445
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortgage payment url
    Open Browser    ${url}    chrome
    Sleep    2s

Close Browser session
    Close Browser