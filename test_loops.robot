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