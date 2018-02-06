*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  ../Sources/Common.robot  # necessary for Setup & Teardown
Resource  ../Sources/PO/SearchPage.robot  # necessary for lower level keywords in test cases
Resource  ../Sources/PO/SearchResultsPage.robot  # necessary for lower level keywords in test cases
Test Setup          Begin_Web_Test
Test Teardown       End_Web_Test

#use the command below to run the test
# pybot -i test -d Results Test/FundaEuropaSearch.robot

*** Test Cases ***
Europa_Search_Default_Values
    [Tags]  test
    SearchPage.Load
    SearchPage.Choose_Europa
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_europa

Europa_Search_All_Land
    [Tags]  test
    SearchPage.Load
    SearchPage.Choose_Europa
    SearchPage.Select_Land                              id=Land-heel-europa
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_europa

Europa_Search_Belgium
    [Tags]  test
    SearchPage.Load
    SearchPage.Choose_Europa
    SearchPage.Select_Land                              id=Land-belgie
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_europa

Europa_Search_Albanie
    [Tags]  test
    SearchPage.Load
    SearchPage.Choose_Europa
    SearchPage.Select_Land                              id=Land-albanie
    SearchPage.Click_Search
    SearchResultsPage.Verify_0_resultaten_search

