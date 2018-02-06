*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  ../Sources/Common.robot  # necessary for Setup & Teardown
Resource  ../Sources/PO/SearchPage.robot  # necessary for lower level keywords in test cases
Resource  ../Sources/PO/SearchResultsPage.robot  # necessary for lower level keywords in test cases
Test Setup          Begin_Web_Test
Test Teardown       End_Web_Test

#use the command below to run the test
# pybot -i test -d Results Test/FundaKoopSearch.robot

*** Test Cases ***
robot
    [Tags]  test
    SearchPage.Load
    sleep  20

Koop_Search_Default_Values
    [Tags]  test
    SearchPage.Load
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_koop

Koop_Search_By_Name_Amsterdam_No_Other_Fields
    [Tags]  test
    SearchPage.Load
    SearchPage.Enter_Search_Name            Amsterdam
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_koop

Koop_Negative_Search_By_Name_Invalidname_No_Other_Fields
    [Tags]  test
    SearchPage.Load
    SearchPage.Enter_Search_Name            invalidCityName
    SearchPage.Click_Search
    SearchResultsPage.Verify_invalid_search

Koop_Search_By_Name_Amsterdam_15km
    [Tags]  test
    SearchPage.Load
    SearchPage.Select_Distance              + 15 km
    SearchPage.Enter_Search_Name            Amsterdam
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_koop

Koop_Search_By_Name_Amsterdam_0km_Min_Price_Max_Value
    [Tags]  test
    SearchPage.Load
    SearchPage.Select_Minimum_Price         € 2.000.000
    SearchPage.Enter_Search_Name            Amsterdam
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_koop

Koop_Search_By_Name_Amsterdam_0km_Max_Price_Min_Value
    [Tags]  test
    SearchPage.Load
    SearchPage.Select_Maximum_Price         € 50.000
    SearchPage.Enter_Search_Name            Amsterdam
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_koop

Koop_Search_By_Name_Amsterdam_0km_Max_Price_Max_Value
    [Tags]  test
    SearchPage.Load
    SearchPage.Select_Maximum_Price         € 2.000.000
    SearchPage.Enter_Search_Name            Amsterdam
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_koop

Koop_Search_By_Name_Amsterdam_0km_Min_And_Max_Price_Max_Values
    [Tags]  test
    SearchPage.Load
    SearchPage.Select_Minimum_Price         € 2.000.000
    SearchPage.Select_Maximum_Price         € 2.000.000
    SearchPage.Enter_Search_Name            Amsterdam
    SearchPage.Click_Search
    SearchResultsPage.Verify_valid_search
    SearchResultsPage.Verify_valid_search_koop
