*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Library         Collections
Library         ../Resources/customLibraries/Shop.py
Test Setup      open the browser with the url    firefox
Test Teardown   Close Browser Session
Resource        ../Resources/PO/Generic.robot
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/PO/ShopPage.robot
Resource    ../Resources/PO/CheckoutPage.robot
Resource    ../Resources/PO/ConfirmationPage.robot


*** Variables ***
@{listOfProducts}    Blackberry    Nokia Edge
${country_name}      United States of America


*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    SMOKE
    LandingPage.Fill the login form   ${user_name}    ${invalid_password}
    LandingPage.Wait until Element is visible on the page
    LandingPage.Verify error message is correct


End to end ecommerce Product validation
    [Tags]    REGRESSION
    LandingPage.Fill The Login Form    ${user_name}    ${valid_password}
    ShopPage.Wait until Element is visible on the page
    ShopPage.Verify Card titles in the Shop page
    Add Items To Cart And Checkout    ${listOfProducts}
    CheckoutPage.Verify items in the Checkout Page and Proceed
    ConfirmationPage.Enter the Country and select the terms    ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase


Select the Form and navigate to Child window
    LandingPage.Fill The Login Details And Form







