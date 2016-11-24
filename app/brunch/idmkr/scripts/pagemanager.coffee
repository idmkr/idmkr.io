'use strict'

PageTransitions = require('idmkr/pagetransitions')

getPage = (p) -> require('idmkr/pages/' + p)
fullPage = $.fn.fullpage

handleHash = (h = location.hash) ->
    #Load a section if hash not empty
    if h and h isnt '#'
        pageLocation = h.replace('#','').split('/')
        fullPage.moveTo(pageLocation[0], pageLocation[1])

options =
    animation : 27
    onEndAnimation : ->
        handleHash()

module.exports =
    init : (page) ->
        PageTransitions.init()
        require('idmkr/fullpage').create getPage(page)
        # Close introduction loader
        if location.hash.indexOf('test-intro') is -1 then @next()

    initMobile : (page) ->
        PageTransitions.init()
        console.log page
        require('idmkr/mobile/fullpage').create getPage(page)
        # Close introduction loader
        if location.hash.indexOf('test-intro') is -1 then @next()

    next : -> PageTransitions.nextPage options

    load : (page) -> PageTransitions.loadPage page, options, getPage(page)

    scroll : (method, options) ->
        fullPage['move' + $.camelCase('-' + method)].apply fullPage, options
