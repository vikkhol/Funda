*** Settings ***
Library  Selenium2Library

#SearchResultsPage page locators
*** Variables ***
${results} =                                        xpath=//form/div[2]/div[1]/span

*** Keywords ***
Verify_valid_search
    Wait Until Page Contains                        result

Verify_valid_search_koop
    Wait Until Page Contains                        koopwoningen

Verify_valid_search_huur
    Wait Until Page Contains                        huurwoningen

Verify_valid_search_nieuwbouw
    Wait Until Page Contains                        nieuwbouwprojecten

Verify_valid_search_recreatie
    Wait Until Page Contains                        recreatiewoningen

Verify_valid_search_europa
    Wait Until Page Contains                        europese woningen

Verify_invalid_search
    Wait Until Page Contains                        We kunnen
    Wait Until Page Contains                        niet vinden

Verify_0_resultaten_search
    Wait Until Page Contains                        0 resultaten