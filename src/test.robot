*** Settings ***
Resource          functions.robot
Suite Setup       Open Browser At E-commerce
Suite Teardown    Tests Teardown

*** Variables ***

*** Test Cases ***

Login User at Submarino
    Login User    ${USER}    ${PASSWORD}
