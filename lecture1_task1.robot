*** Settings ***
Library    Collections

*** Variables ***
@{LIST OF NUMBERS}    ${1}    ${2}    ${3}    ${5}    ${1}    ${0}    ${-1}    ${10}
${EXPECTED MIN}       ${-1}
${EXPECTED MAX}       ${10}
@{EXPECTED UNIQUE}    ${1}    ${2}    ${3}    ${5}    ${0}    ${-1}    ${10}
${EXPECTED SUM}       ${21}

*** Test Cases ***
Check Min Max Value
    ${max}    Evaluate    max(${LIST OF NUMBERS})
    Check If Equal    ${EXPECTED MAX}    ${max}

    ${min}    Evaluate    min(${LIST OF NUMBERS})
    Check If Equal    ${EXPECTED MIN}    ${min}

Displaying a Unique Value
    ${unique}    Remove Duplicates    ${LIST OF NUMBERS}
    Check If Equal    ${EXPECTED UNIQUE}    ${unique}

Search sum of values
    ${sum}    Evaluate    sum(${LIST OF NUMBERS})
    Check If Equal    ${EXPECTED SUM}    ${sum}

*** Keywords ***
Check If Equal
    [Arguments]    ${expected value}    ${actual value}
    Should be equal    ${expected value}    ${actual value}
    ...                msg=Expected value: ${expected value}, actual value: ${actual value}
