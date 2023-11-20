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


