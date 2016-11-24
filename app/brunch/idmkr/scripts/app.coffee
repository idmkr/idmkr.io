'use strict'

# State
UriState = require('idmkr/uristate')
# Controller
PageManager = require('idmkr/pagemanager')

$ ->
    ###
    # Outdated Browser
    ###
    outdatedBrowser
        bgColor: '#f25648'
        color: '#ffffff'
        lowerThan: 'transform'
        languagePath: '/js/outdatedbrowser/lang/fr.html'


    ###
    # Links handler
    ###
    # Custom Ajax Page Change
    $(document).on 'click', '[data-animation]', (ev) ->
        $btn = $(this)
        PageManager.load $btn.attr('href'), $btn.data('animation')
        false
    # Dynamic Fullpage internal jumps
    $(document).on 'click', '[data-fullpage-move]',  ->
        method = $(this).data('fullpage-move')
        options = null
        if $.isPlainObject(method)
            for i of method
                options = method[i]
                method = i
        PageManager.scroll method, options
        false

    ###
    # History Go Back handler
    ###
    $(window).on
        'popstate' :  (e)  ->
            newUri = UriState.detect()
            # State has changed which can only means the back button was hit
            # and the page has to change
            if UriState.get() isnt newUri then PageManager.load newUri
        'pagetransitions:urichanged' : (e, uri) -> UriState.set(uri)

###
# Load assets & initialize the page
###
module.exports =
    init : () ->
        $(window).bind 'load', -> PageManager.init UriState.get()
    initMobile : () ->
        $(window).bind 'load', -> PageManager.initMobile UriState.get()
 