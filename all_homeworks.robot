*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${name}    John Doe
${age}    30
@{fruits}    apple    banana    orange
&{person}    name=John    age=30    city=New York
@{favorite}    sex and the city    desperate housewives    friends

*** Test Cases ***
1.1 Test
    Create List    ${fruits}
    Log    ${fruits}
    Append To List    ${fruits}    Pear    Coconut
    Log    ${fruits}
    Create Dictionary    &{person}

    Set To Dictionary    ${person}    name=Nastya    age=38    city=Vilnius
    Log    ${person}
    Create List    ${favorite}
    Log    ${favorite}


*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${url}    https://www.google.com/
${browser}    chrome
${browser1}    edge

*** Test Cases ***
1.2 Test
    ${morze}    Create Dictionary
    Open Browser    https://www.wikipedia.org   ${browser1}
    Maximize Browser Window
    Input Text    //*[@id="searchInput"]    азбука морзе
    Click Button    //*[@class="pure-button pure-button-primary-progressive"][@type="submit"]
    @{letters}    Get Webelements    //table[@class="wikitable sortable jquery-tablesorter"]/tbody/tr/td[not(@colspan)]/a[@title][1]
    @{melodies}    Get Webelements    //table[@class="wikitable sortable jquery-tablesorter"]/tbody/tr/td[4]
    FOR    ${index}    ${locator}    IN ENUMERATE    @{letters}
    ${letterName}    Get Text    ${locator}
    ${melody}    Get Text    ${melodies}[${index}]
    Set To Dictionary    ${morze}    ${letterName}=${melody}
    END
    Log To Console    ${morze}
    Log    ${morze}




