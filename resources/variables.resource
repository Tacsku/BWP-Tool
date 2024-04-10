*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${MAIN_URL}    https://bwpool.azurewebsites.net/
${PARTNERS_URL}    //a[@href="Customer"]

*** Keywords ***
Open Chrome
    Open Browser    ${MAIN_URL}    ${BROWSER}

Navigate to Partners
    Click Element    ${PARTNERS_URL}
