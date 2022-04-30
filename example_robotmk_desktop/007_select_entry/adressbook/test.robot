# Now the entry we want to open must be selected from the search results. 
# 
# We have added one second sleep time to make sure that the search has finished. 
#
# The adressbook ap is a little bit picky: doubleclicking an entry which is not selected 
# does not work reliable!
# To do the "click", we have taken a screenshot of the _inactive_ region of the last 
# name of the person. 
# The custom keyword "Wait For And Click" returns the location (x,y coordinates) of the
# found region - we use these coordinates with "MoveDoubleClick" which does not need 
# an image anymore but just the coordinates!
# 
# Tip: it is not possible to use "Wait For And Click" and "Wait For And Doubleclick" with 
# the same image. 
# - Reason 1: As soon as the robot clicks the entry it gets active => the reference image 
#   is does not match anymore. 
# - Reason 2: Even worse, the click also triggers a "hover" effect which shows a hint flag 
#   at the mouse position. This makes the detectoin of the entry unreliable. 


##### 
# Your tasks: 
# - Set a breakpoint before MoveDoubleClick to see the coordinates of the found region. 
# - The test should open now the Person's entry. 

*** Settings ***
Documentation     This suite opens the "Free Address Book" and searches for a given user. 
...  The user can be given by variable `SEARCH_NAME` (first + last name).
Library       ImageHorizonLibrary  reference_folder=${CURDIR}\\images   
Library       Process 
Library       String       
Library       common\\WindowsUtils.py    
Resource      common\\ImageHorizon.resource                         

Suite Setup     Suite Initialization    
Suite Teardown  Suite Finalization      

*** Variables ***
${APP}      C:\\Program Files (x86)\\GAS Softwares\\Free Address Book\\AddressBook.exe  
${EXE}      AdressBook.exe        
${SEARCH_NAME}  Lisa Simpson          

*** Test Cases ***
Search User In Database 
    Search For Entry     
    # Set a breakpoint here   
    No Operation

*** Keywords ***
Search For Entry 
    Press Combination  Key.CTRL  f     
    Type  ${FIRST_NAME}       
    Sleep  1   # ⚠️    
    ${loc}=  Wait For And Click  ${LAST_NAME}  # ⚠️   
    # Set a breakpoint here 
    MoveDoubleClick    ${loc}                  # ⚠️   

Kill Addressbook
    Run Process  cmd.exe /c taskkill /F /IM AddressBook.exe  shell=True   

Suite Initialization 
    @{name}=  Split String  ${search_name}               
    Set Suite Variable    ${FIRST_NAME}  ${name}[0]      
    Set Suite Variable    ${LAST_NAME}  ${name}[1]       
    Open Address Book    

Suite Finalization     
    Close Address Book   

Open Address Book 
    Kill Addressbook    
    Launch Application    "${APP}"  alias=addressbook   
    Wait For Window And Activate    .*Free Address Book  maximize=True    
    Wait For          ab_logo          

Close Address Book 
    Terminate Application  alias=addressbook      

