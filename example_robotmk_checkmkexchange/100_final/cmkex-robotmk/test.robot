*** Settings ***
# Library           SeleniumLibrary  screenshot_root_directory=EMBED
# Suite Setup        Suite Initialization
# Suite Teardown     Suite Finalization
# Test Teardown     Test Finalization

*** Variables *** 
# ${URL}        https://exchange.checkmk.com    
# ${BROWSER}    firefox
# ${RMK_VERSION}  1.2.9

*** Test Cases ***

# Robotmk Is Most Downloaded
#     Assert Most Downloaded Item Contains  RobotMK

Robotmk Version for CMK 1 available
    Go To    ${URL}
    Search And Click Robotmk Package
    Check MKP Version Is Available  1

Robotmk Version for CMK 2 available
    Go To    ${URL}
    Search And Click Robotmk Package
    Check MKP Version Is Available  2

*** Keywords ***
# Suite Initialization
#     Start Browser
#     Maximize Browser Window
#     Wait For And Click  //button[@aria-label='Accept all']  


# Suite Finalization
#     Close All Browsers

# Test Finalization
#     Run Keyword If Test Failed    Capture Page Screenshot  filename=EMBED

# Wait for and click 
#     [Arguments]  ${selector}  ${timeout}=10
#     Wait Until Element Is Visible    ${selector}  ${timeout}
#     Click Element  ${selector}

# Start Browser
#     Open Browser  ${URL}  ff_profile_dir=set_preference("intl.accept_languages", "en")
#     No Operation

# Assert Most Downloaded Item Contains    
    # [Arguments]  ${text}
    # ${result}=  Run Keyword And Return Status    
    # # ...  Element Should Be Visible    //header[contains(text(), 'Most downloaded')]/following-sibling::article[1]/div/h5/a[contains(text(),'${text}')]
    # Run Keyword If    ${result}!=True    
    # ...  Fail  msg=Robotmk is not Download No.1 anymore

Search And Click Robotmk Package
    # Input Text    //input[@placeholder='here for your package']    robotmk
    # Wait Until Element Is Visible    //header[contains(text(), 'Search results')]/following-sibling::div/article/div/h5/a[contains(.,'RobotMK')]
    # # Geht nicht (HTML innendrin)
    # #Wait Until Element Is Visible    //header[contains(text(), 'Search results')]/following-sibling::div/article/div/h5/a[contains(text(),'RobotMK')]
    # Click Element    //header[contains(text(), 'Search results')]/following-sibling::div/article/div/h5/a[contains(.,'RobotMK')]
    
# Check MKP Version Is Available
#     [Arguments]  ${cmkversion}
#     ${result}=  Run Keyword And Return Status    
#     ...  Element Should Be Visible  //h2[text()='Latest Version ${cmkversion}.x']/following-sibling::div//td[contains(.,'Version: v${RMK_VERSION}')]
#     Run Keyword If    ${result}!=True 
#     ...  Fail  msg=Robotmk package ${RMK_VERSION} for Checkmk V${cmkversion}.x is not available!