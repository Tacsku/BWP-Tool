*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER}    Chrome
${MAIN_URL}    https://bwpool.azurewebsites.net/
${PARTNERS_URL}    //a[@href="Customer"]

*** Keywords ***
Open Chrome
    Open Browser    ${MAIN_URL}    ${BROWSER}

Navigate to Partners
    Click Element    ${PARTNERS_URL}

Get random User Data from local JSON File
    ${json_file}    Get File    ${CURDIR}/random_people.json
    ${json_data}    Evaluate    json.loads('''${json_file}''')    json
    ${first_name}    Set Variable    ${json_data}[0][first_name]
    ${last_name}    Set Variable    ${json_data}[0][last_name]
    ${name}    Set Variable    ${first_name} ${last_name}
    ${email}    Set Variable    ${json_data}[0][email]

    