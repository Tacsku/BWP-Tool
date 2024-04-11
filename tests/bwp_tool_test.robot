*** Settings ***
Documentation    BWP Website Testing - Partner, Location and Device Test
Resource    variables.resource

*** Test Cases ***
BWP Website Test - Partner, Location and Device Test
    Open Chrome
    Navigate to Partners
    ${body}    Get random User Data from local JSON File
    Add a Partner    ${body}