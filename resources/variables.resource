*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String

*** Variables ***
${BROWSER}    Chrome
${MAIN_URL}    https://bwpool.azurewebsites.net/
${PARTNERS_URL}    //a[@href="Customer"]
${PARTNER_NAME_XPATH}    //input[@id="name"]
${PARTNER_EMAIL_XPATH}    //input[@id="email"]
${PARTNER_COMMENT_XPATH}    //input[@id="comment"]
${ADD_BUTTON}    //button[@aria-label="Add"]
${SAVE_BUTTON}    //button[@class="e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat"]
${LOCATIONS_URL}    //a[@href="Location"]

*** Keywords ***
Open Chrome
    Open Browser    ${MAIN_URL}    ${BROWSER}

Navigate to Partners
    Wait Until Element Is Visible    ${PARTNERS_URL}
    Click Element    ${PARTNERS_URL}

Get random User Data from local JSON File
    ${person_index}    Generate Random String    2    [NUMBERS]
    ${json_file}    Get File    ${CURDIR}/random_people.json
    ${json_data}    Evaluate    json.loads('''${json_file}''')    json
    Set Global Variable    ${body}    ${json_data}[${person_index}]
    RETURN    ${json_data}[${person_index}]
 
Add a Partner
    [Arguments]    ${body}
    ${first_name}    Set Variable   ${body}[first_name]
    ${last_name}    Set Variable    ${body}[last_name]
    ${name}    Set Variable    ${first_name} ${last_name}
    ${email}    Set Variable    ${body}[email]
    ${id}    Set Variable    ${body}[id]
    Sleep    5s
    Wait Until Element Is Visible    ${ADD_BUTTON}
    Click Button    ${ADD_BUTTON}
    Wait Until Element Is Visible    ${PARTNER_NAME_XPATH}
    Input Text    ${PARTNER_NAME_XPATH}    ${name}
    Input Text    ${PARTNER_EMAIL_XPATH}    ${email}
    Input Text    ${PARTNER_COMMENT_XPATH}    ${id}
    Click Button    ${SAVE_BUTTON}

Navigate to Locations
    Wait Until Element Is Visible   ${LOCATIONS_URL} 
    Click Element    ${LOCATIONS_URL}

    