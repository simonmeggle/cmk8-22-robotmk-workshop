# robocop: disable=missing-doc-suite
# robocop: disable=redundant-equal-sign
# robocop: disable=missing-doc-testcase
# robocop: disable=not-capitalized-keyword-name
# robocop: disable=too-many-calls-in-keyword
# robocop: disable=too-few-calls-in-keyword
# robocop: disable=missing-doc-keyword

*** Settings ***
Documentation  This Robot writes a friendly message 
...  into a text file. 
Library                             OperatingSystem

***Test Cases***
Write Hello World To File
    [Documentation]  This test greets with a file. 
    Write File    new_file.txt  Hello World!


*** Keywords *** 
Write File
    [Documentation]  Takes filename and message as arguments and writes
    ...  the message into the given file. The file will be created, if 
    ...  it does not exist. 
    [Arguments]  ${filename}  ${message}=This is a default message
    Create File  ${filename}  ${message}