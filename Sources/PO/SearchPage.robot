*** Settings ***
Library  Selenium2Library

*** Variables ***
${LOGIN_P_URL} =                                https://www.funda.nl/

#login page locators
${koop} =                                       link=Koop
${huur} =                                       link=Huur
${nieuwbouw} =                                  link=Nieuwbouw
${recreatie} =                                  link=Recreatie
${europa} =                                     link=Europa

${searchField} =                                id=autocomplete-input
${distance} =                                   id=Straal
${minRange} =                                   id=range-filter-selector-select-filter_koopprijsvan
${maxRange} =                                   id=range-filter-selector-select-filter_koopprijstot

${minRangeHuur} =                               id=range-filter-selector-select-filter_huurprijsvan
${maxRangeHuur} =                               id=range-filter-selector-select-filter_huurprijstot

${land} =                                       xpath=//form/div[1]/div/fieldset/div/div

${search_button} =                              xpath=//form/div[1]/div/div


*** Keywords ***
Load
    Go To                                       ${LOGIN_P_URL}
    sleep   2

Choose_Koop
    Click Element                               ${koop}
    sleep                                       1

Choose_Huur
    Click Element                               ${huur}
    sleep                                       1

Choose_Nieuwbouw
    Click Element                               ${nieuwbouw}
    sleep                                       1

Choose_Recreatie
    Click Element                               ${recreatie}
    sleep                                       1

Choose_Europa
    Click Element                               ${europa}
    sleep                                       1


Enter_Search_Name
    [arguments]  ${place}
    Input Text                                  ${searchField}           ${place}

Select_Distance
    [arguments]                                 ${arguments}
    Select From List                            ${distance}             ${arguments}
    sleep                                       1

Select_Minimum_Price
    [arguments]                                 ${arguments}
    Select From List                            ${minRange}             ${arguments}
    sleep                                       1

Select_Maximum_Price
    [arguments]                                 ${arguments}
    Select From List                            ${maxRange}             ${arguments}
    sleep                                       1

Select_Minimum_Price_Huur
    [arguments]                                 ${arguments}
    Select From List                            ${minRangeHuur}             ${arguments}
    sleep                                       1

Select_Maximum_Price_Huur
    [arguments]                                 ${arguments}
    Select From List                            ${maxRangeHuur}             ${arguments}
    sleep                                       1

Select_Land
    [arguments]                                 ${arguments}
    Click Element                               ${land}
    sleep                                       1
    Click Element                               ${arguments}
    sleep                                       1

Click_Search
    sleep   1
    Click Element                               ${search_button}
    sleep   1
    Click Element                               ${search_button}
    sleep  3

