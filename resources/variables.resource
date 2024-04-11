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
${LOCATION_NAME_XPATH}    //input[@placeholder="Ügyfél"]
${LOCATION_CITY_XPATH}    //input[@id='varos']
${LOCATION_ZIP_CODE_XPATH}    //input[@id='zip']
${LOCATION_STREET_XPATH}    //input[@id='utca']
${DEVICE_URL}    //a[@href="Tool"]
${DEVICE_MAKE_XPATH}    //input[@id="name"]
${DEVICE_NAME_XPATH}    //input[@placeholder="Ügyfél"]
${DEVICE_LOCATION_XPATH}    //input[@placeholder="Telephely"]
${DEVICE_DESCRIPTION_XPATH}    //textarea[@id="Desc"]
${DEVICE_COMMENT_XPATH}    //textarea[@id="Comm"]
${EXCEL_EXPORT_BUTTON}    //button[@aria-label="Excel Export"]
${SEARCHBAR}    //input[@id="Grid_ToolbarSearchBox"]
${SEARCH_ICON}    //span[@class='e-searchclear e-search-icon e-icons e-input-group-icon']


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
    Set Global Variable    ${person_body}    ${json_data}[${person_index}]
    RETURN    ${json_data}[${person_index}]
 
Add a Partner
    [Arguments]    ${person_body}
    ${first_name}    Set Variable   ${person_body}[first_name]
    ${last_name}    Set Variable    ${person_body}[last_name]
    ${name}    Set Variable    ${first_name} ${last_name}
    ${email}    Set Variable    ${person_body}[email]
    ${id}    Set Variable    ${person_body}[id]

    Sleep    1s
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

Add a Location
    [Arguments]    ${person_body}
    ${first_name}    Set Variable   ${person_body}[first_name]
    ${last_name}    Set Variable    ${person_body}[last_name]
    ${name}    Set Variable    ${first_name} ${last_name}
    ${id}    Set Variable    ${person_body}[id]
    ${city}    Set Variable    ${person_body}[address][city]
    ${street_name}    Set Variable    ${person_body}[address][street_name]
    ${zip_code}    Set Variable    ${person_body}[address][zip_code]

    Click Element    ${LOCATIONS_URL}
    Wait Until Element Is Visible    ${ADD_BUTTON}
    Sleep    1
    Click Button    ${ADD_BUTTON}
    Wait Until Element Is Visible    ${LOCATION_NAME_XPATH}
    Input Text    ${LOCATION_NAME_XPATH}    ${name}
    Sleep    1
    Click Element    //li[.='${name}']
    Input Text    ${LOCATION_CITY_XPATH}    ${city}
    Input Text    ${LOCATION_ZIP_CODE_XPATH}    ${zip_code}
    Input Text    ${LOCATION_STREET_XPATH}    ${street_name}
    Click Button    ${SAVE_BUTTON}

Navigate to Devices
    Wait Until Element Is Visible    ${DEVICE_URL}
    Click Element    ${DEVICE_URL}

Get random Device Data from local JSON File
    ${device_index}    Generate Random String    2    [NUMBERS]
    ${json_file}    Get File    ${CURDIR}/random_device.json
    ${json_data}    Evaluate    json.loads('''${json_file}''')    json
    Set Global Variable    ${device_body}    ${json_data}[${device_index}]
    RETURN    ${json_data}[${device_index}]
  

Add a Device
    [Arguments]    ${person_body}    ${device_body}
    ${first_name}    Set Variable   ${person_body}[first_name]
    ${last_name}    Set Variable    ${person_body}[last_name]
    ${name}    Set Variable    ${first_name} ${last_name}
    ${manufacturer}    Set Variable    ${device_body}[manufacturer]
    ${model}    Set Variable    ${device_body}[model]
    ${platform}    Set Variable    ${device_body}[platform]
    ${serial_number}    Set Variable    ${device_body}[serial_number]

    Click Element    ${DEVICE_URL}
    Wait Until Element Is Visible    ${ADD_BUTTON}
    Sleep    1
    Click Button    ${ADD_BUTTON}
    Wait Until Element Is Visible    ${DEVICE_MAKE_XPATH}   
    Input Text    ${DEVICE_MAKE_XPATH}    ${manufacturer} ${model}   
    Input Text    ${DEVICE_NAME_XPATH}    ${name}   
    Sleep    1
    Click Element    //li[.='${name}']
    Input Text    ${DEVICE_DESCRIPTION_XPATH}    ${platform}
    Input Text    ${DEVICE_COMMENT_XPATH}    ${serial_number}
    Click Button    ${SAVE_BUTTON}

Export to Excel
    Wait Until Element Is Visible    ${EXCEL_EXPORT_BUTTON}
    Click Button    ${EXCEL_EXPORT_BUTTON}

Search in List
    [Arguments]    ${person_body}
    ${first_name}    Set Variable   ${person_body}[first_name]
    ${last_name}    Set Variable    ${person_body}[last_name]
    ${name}    Set Variable    ${first_name} ${last_name}
    Sleep    1
    Input Text    ${SEARCHBAR}    ${name}
    Sleep    1
    Click Element    ${SEARCH_ICON}
