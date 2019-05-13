*** Settings ***
Library           Selenium2Library
Resource          SCCP关键步骤封装.robot

*** Test Cases ***
账号密码均正确
    [Documentation]    1、在谷歌浏览器中正常输入网站；
    ...    2、输入正确的账号、密码，点击登录。
    Open Browser    http://192.168.99.81:9010/wxapp/masterData/index.jsp    Chrome
    Input text    id=userId    qtyy01
    Input text    name=password    000000
    click button    id=login
    Close All Browsers

有效的账号无效的密码
    [Documentation]    1、在谷歌浏览器中正常输入网站；
    ...    2、输入有效的账号，无效的密码，点击登录。
    Open Browser    http://192.168.99.81:9010/wxapp/masterData/index.jsp    Chrome
    Input text    id=userId    qtyy01
    Input text    name=password    00000
    click button    id=login
    wait until page contains    密码错误
    page should contain    密码错误
    close all browsers

无效的账号有效的密码
    [Documentation]    1、在谷歌浏览器中正常输入网站；
    ...    2、输入无效的账号，有效的密码，点击登录。
    Open Browser    http://192.168.99.81:9010/wxapp/masterData/index.jsp    Chrome
    Input text    id=userId    qtyy0
    Input text    name=password    000000
    click button    id=login
    wait until page contains    用户不存在
    page should contain    用户不存在
    close all browsers

账号为空密码正确
    [Documentation]    1、在谷歌浏览器中正常输入网站；
    ...    2、输入账号为空，正确的密码，点击登录。
    Open Browser    http://192.168.99.81:9010/wxapp/masterData/index.jsp    Chrome
    Input text    name=password    000000
    click button    id=login
    Page Should Contain    用户名不能为空
    Close Browser

账号正确密码为空
    [Documentation]    1、在谷歌浏览器中正常输入网站；
    ...    2、输入账号为正确，错误的密码，点击登录。
    Open Browser    http://192.168.99.81:9010/wxapp/masterData/index.jsp    Chrome
    Input text    id=userId    qtyy01
    click button    id=login
    page should contain    密码不能为空
