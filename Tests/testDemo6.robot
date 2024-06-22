*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Library         Collections
Library         ../Resources/customLibraries/Shop.py
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        ../Resources/PO/Generic.robot
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/PO/ShopPage.robot


*** Variables ***
@{listOfProducts}    Blackberry    Nokia Edge


*** Test Cases ***
Validate Unsuccessful Login

    LandingPage.Fill the login form   ${user_name}    ${invalid_password}
    LandingPage.Wait until Element is visible on the page
    LandingPage.Verify error message is correct


Validate Cards display in the Shopping Page
    LandingPage.Fill The Login Form    ${user_name}    ${valid_password}
    ShopPage.Wait until Element is visible on the page
    ShopPage.Verify Card titles in the Shop page
    Add Items To Cart And Checkout    ${listOfProducts}


Select the Form and navigate to Child window
    LandingPage.Fill The Login Details And Form







