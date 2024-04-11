*** Settings ***
Documentation    BWP Website Testing - Partner, Location and Device Test
Resource    variables.resource

*** Test Cases ***
BWP Website Test - Partner, Location and Device Test
    Open Chrome
    Navigate to Partners
    ${person_body}    Get random User Data from local JSON File
    Add a Partner    ${person_body}
    Navigate to Locations
    Add a Location    ${person_body}
    Navigate to Devices
    ${device_body}    Get random Device Data from local JSON File
    Add a Device    ${person_body}    ${device_body}
    Export to Excel
    Navigate to Locations
    Search in List    ${person_body}
    Navigate to Profile    ${person_body}