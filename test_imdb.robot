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
1 Test
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    ${rating_dict}    Create Dictionary
    FOR    ${item}    IN    @{movies}
    Input Text    //*[@id="suggestion-search"]    ${item}
    Click Element    //*[@id="suggestion-search-button"][@type="submit"]
    Page Should Contain Element    (//*[@class ="ipc-metadata-list-summary-item__t"])[1]
    Click Link    (//*[@class ="ipc-metadata-list-summary-item__t"])[1]
    ${title}    Get Text    //*[@data-testid ="hero__pageTitle"]
    ${rating}    Get Text    (//*[@data-testid="hero-rating-bar__aggregate-rating__score"])[1]
    Set To Dictionary    ${rating_dict}    ${title}=${rating}
    END
    ${sorted_dict}    Sort Dictionary By Values    ${rating_dict}
    Log To Console    ${sorted_dict}
