*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  ../Sources/Common.robot  # necessary for Setup & Teardown
Resource  ../Sources/PO/SearchPage.robot  # necessary for lower level keywords in test cases
Resource  ../Sources/PO/SearchResultsPage.robot  # necessary for lower level keywords in test cases
Test Setup          Begin_Web_Test
Test Teardown       End_Web_Test

#use the command below to run the test
# pybot -i test -d Results Test/FundaNieuwbouwSearch.robot

*** Test Cases ***
Nieuwbouw_Search_Default_Values
    [Tags]  test
    SearchPage.Load
    SearchPage.Choose_Nieuwbouw
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_nieuwbouw

Nieuwbouw_Search_By_Name_Amsterdam_No_Other_Fields
    [Tags]  test
    SearchPage.Load
    SearchPage.Choose_Nieuwbouw
    SearchPage.Enter_Search_Name            Amsterdam
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_nieuwbouw

Nieuwbouw_Negative_Search_By_Name_Invalidname_No_Other_Fields
    [Tags]  test
    SearchPage.Load
    SearchPage.Choose_Nieuwbouw
    SearchPage.Enter_Search_Name            invalidCityName
    SearchPage.Click_Search
    SearchResultsPage.Verify_invalid_search

Nieuwbouw_Search_By_Name_Amsterdam_15km
    [Tags]  test
    SearchPage.Load
    SearchPage.Choose_Nieuwbouw
    SearchPage.Select_Distance              + 15 km
    SearchPage.Enter_Search_Name            Amsterdam
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_nieuwbouw

