*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${basic_auth_user}    admin
${basic_auth_password}    admin
${basic_auth_url}    https://${basic_auth_user}:${basic_auth_password}@the-internet.herokuapp.com/basic_auth