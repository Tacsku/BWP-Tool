*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${MAIN_URL}    https://bwpool.azurewebsites.net/

*** Keywords ***
Open Chrome
    Open Browser    ${MAIN_URL}    ${BROWSER}
