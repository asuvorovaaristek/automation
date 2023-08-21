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
#
#1 Test
#    Open Browser    ${url}   ${browser}
#    Maximize Browser Window
#    Sleep    5s
#    Input Text    //*[@jsname="yZiJbe"]    wikipedia
#    Sleep    7s
#    Click Button    //*[@role="button"][@type="submit"]
#    Sleep    5s

2 Test
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


