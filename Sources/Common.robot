*** Settings ***
Library  Selenium2Library
Resource  ../Sources/PO/SearchPage.robot

*** Variables ***

*** Keywords ***
Begin_Web_Test
    Open Browser  about:blank  chrome
    # Maximize Browser Window
    Load


End_Web_Test
    Close Browser

#ClickElement
#    [arguments]                                                     ${locator}
#    Wait Until Keyword Succeeds 	2 min 	5 sec 	Click Element 	${locator}