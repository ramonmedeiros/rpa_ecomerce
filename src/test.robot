*** Settings ***
Resource          functions.robot
Suite Setup       Open Browser At E-commerce
Suite Teardown    Tests Teardown

*** Variables ***

*** Test Cases ***

Login User at Submarino
    Login User    ${USER}    ${PASSWORD}

Search Product and Add To Cart
    Type Product on Search Bar    samsung galaxy s8 edge
    Click on Product With Specific Name    Smartphone Samsung Galaxy S8

Buy Product With Credit Card
    Click Buy Button
    Click Continue To Cart Button
    Go To Checkout

    Use Credit Card As Payment

Search Product and Add To Cart
    Go To    ${URL}
    Type Product on Search Bar    iphone 8 plus 64gb
    Click on Product With Specific Name    iPhone 8 Plus Prata 64GB

Buy 2 Product With Credit Card
    Click Buy Button
    Click Continue To Cart Button

    Increase Quantity    Iphone 8 Plus Silver    2
    Go To Checkout

    Use Credit Card As Payment

Wipe Cart
    Remove Product From Cart    Smartphone Samsung Galaxy
 
