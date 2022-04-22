*** Settings ***
Documentation  Demonstrate how to open Firefox with a predefined localization.
Library           SeleniumLibrary

*** Variables *** 
${URL}        https://youtube.com
${BROWSER}    firefox

*** Test Cases ***
Test 1
    Open Browser  ${URL}  ff_profile_dir=set_preference("intl.accept_languages", "pl")
    No Operation
