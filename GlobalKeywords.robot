*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Keywords ***
Get Item From List And Log
    [Arguments]    ${E}
    FOR    ${item}    IN    @{fruits}
        ${status}    Run Keyword And Return Status    Should Contain    ${item}    e
        Run Keyword If    ${status} == True    Append To List    ${E}    ${item}
    END
    Log To Console    ${E}
    Log    ${E}