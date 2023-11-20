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


*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${name}    John Doe
${age}    30
#@{fruits}    apple    banana    orange
@{fruits1}    pineapple    coconut     pear     lemon     plum
&{person}    name=John    age=30    city=New York
@{favorite}    sex and the city    desperate housewives    friends
${do}    True
@{alph}    a    b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z
&{fruits2}    name=apple    color=green    name1=banana    color1=yellow    name2=orange    color2=orange    name3=grape    color3=green
${fruit}    empty


*** Test Cases ***
1.3 Test
    Log    ${fruits2}
    ${green_fruits}    Create List
    Get Value By Color And Log To Console    ${green_fruits}    avokado    kiwi

*** Keywords ***
Get Value By Color and Log to Console
    [Arguments]    ${green_fruits}    ${fruits}    ${f}
    FOR    ${key}    ${value}    IN     &{fruits2}
        ${status}    Run Keyword And Return Status    Should Contain    ${key}    name
        Run Keyword If    ${status} == True    Set Test Variable    ${fruit}    ${value}
        ${status1}    Run Keyword And Return Status    Should Contain    ${key}    color
        WHILE    ${status1} == True
            ${status2}    Run Keyword And Return Status    Should Be Equal    ${value}    green
            Run Keyword If   ${status2} == True    Append To List    ${green_fruits}    ${fruit}
            BREAK
        END
    END
    Log To Console    ${green_fruits}
    Log To Console    ${fruits}
    Log To Console    ${f}




