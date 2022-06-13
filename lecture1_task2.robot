*** Settings ***
Library    Collections

*** Test Cases ***
Check Convert Celsius to Fahrenheit
    @{celsius}               Create List   ${0}    ${350}    ${-32}    ${100}
    @{fahrenheit_expected}   Create List   ${32}   ${662}    ${-25.6}  ${212}
    ${fahrenheit_convert}    Convert Celsius to Fahrenheit   ${celsius}
    Collections.Lists Should Be Equal    ${fahrenheit_expected}    ${fahrenheit_convert}
    ...                                msg=Expected value: ${fahrenheit_expected}, actual value: ${fahrenheit_convert}

*** Keywords ***
Convert Celsius to Fahrenheit
    [Arguments]    ${celsius}
    @{fahrenheit list}     Create List
    FOR    ${item}    IN    @{celsius}
         ${fahrenheit}    Set Variable    ${9/5*${item}+32}
         Collections.Append To List    ${fahrenheit_list}    ${fahrenheit}
    END
    [Return]    ${fahrenheit list}
