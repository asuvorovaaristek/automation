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



*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Resource        GlobalKeywords.robot

*** Variables ***
${name}    John Doe
${age}    30
@{fruits}    apple    banana    orange
@{fruits1}    pineapple    coconut     pear     lemon     plum
&{person}    name=John    age=30    city=New York
@{favorite}    sex and the city    desperate housewives    friends
${do}    True
@{alph}    a    b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z

*** Test Cases ***
#1 Test
#    FOR    ${index}    ${item}    IN ENUMERATE    @{fruits}
#        Exit For Loop If    '${item}' == 'banana2'
#        Log To Console    ${item} is number ${index}
#    END
#
#    WHILE    '${letter}' != q
#    Log To Console    ${fruits}
#    Set Test Variable    ${letter}    give us next letter in alphabet
#    END

#hometask1
#    FOR   ${item}    IN    @{fruits1}
#        Append To List     ${fruits}    ${item}
#    END
#    Log    ${fruits}
#
#hometask2
#    FOR    ${item}    IN    @{alph}
#        Exit For Loop If    '${item}' == 'q'
#        WHILE    '${item}' != 'q'
#            Log To Console    ${item}
#            BREAK
#        END
#    END

#hometask3
#    Append To List    ${fruits}    pineapple    coconut     pear     lemon     plum    apricot    mango
#    ${E}    Create List
#    FOR    ${item}    IN    @{fruits}
#        ${status}    Run Keyword And Return Status    Should Contain    ${item}    e
#        Run Keyword If    ${status} == True    Append To List    ${E}    ${item}
#    END
#    Log To Console    ${E}
#    Log    ${E}

hometask3
    Append To List    ${fruits}    pineapple    coconut     pear     lemon     plum    apricot    mango
    ${E}    Create List
    Get Item From List And Log    ${E}
*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Library         custom_keywords.py

*** Variables ***
${url}    https://www.imdb.com/
${browser}    edge
@{movies}    interstellar    x-files    gone with the wind    blade runner    star wars    titanic    the dark knight    groundhog day    avatar    gladiator    dirty dancing    pulp fiction


*** Test Cases ***
1.5 Test
    Create File    My_favourite_films.txt
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    ${rating_dict}    Create Dictionary
    FOR    ${item}    IN    @{movies}
    Input Text    //*[@id="suggestion-search"]    ${item}
    Click Element    //*[@id="suggestion-search-button"][@type="submit"]
    Page Should Contain Element    (//*[@class ="ipc-metadata-list-summary-item__t"])[1]
    Click Link    (//*[@class ="ipc-metadata-list-summary-item__t"])[1]
    ${title}    Get PAST    //*[@data-testid ="hero__pageTitle"]
    ${rating}    Get Text    (//*[@data-testid="hero-rating-bar__aggregate-rating__score"])[1]
    Append To File    My_favourite_films.txt    \r${title}=${rating}\n
    END




*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Library         custom_keywords.py

*** Variables ***
${url}    https://www.imdb.com/
${browser}    edge
@{movies}    interstellar    x-files    gone with the wind    blade runner    star wars    titanic    the dark knight    groundhog day    avatar    gladiator    dirty dancing    pulp fiction


*** Test Cases ***
1.4 Test
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    ${rating_dict}    Create Dictionary
    FOR    ${item}    IN    @{movies}
    Input Text    //*[@id="suggestion-search"]    ${item}
    Click Element    //*[@id="suggestion-search-button"][@type="submit"]
    Page Should Contain Element    (//*[@class ="ipc-metadata-list-summary-item__t"])[1]
    Click Link    (//*[@class ="ipc-metadata-list-summary-item__t"])[1]
    ${title}    Get REST    //*[@data-testid ="hero__pageTitle"]
    ${rating}    Get Text    (//*[@data-testid="hero-rating-bar__aggregate-rating__score"])[1]
    Set To Dictionary    ${rating_dict}    ${title}=${rating}
    END
    ${sorted_dict}    Sort Dictionary By Values    ${rating_dict}
    Log To Console    ${sorted_dict}



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



