'use strict'

module.exports =
    create: (options) ->
        if $.fn.fullpage.destroy
            try
                $.fn.fullpage.destroy 'all'
            catch e then console.log e

        $('#toggle').click ->
            $(this).toggleClass 'active'
            $('#overlay').toggleClass 'open'
        $('.overlay-item a').click ->
            $('#toggle').removeClass 'active'
            $('#overlay').removeClass 'open'
            
        $('#' + options.id).fullpage $.extend({
            #menu: '.main-nav'
            #autoScrolling: false
            fitToSectionDelay : 100
            scrollingSpeed: 350
        }, options)

        $('#' + options.id + ' .button-collapse').sideNav()

        options.afterPageLoad?.apply options

        $.fn.fullpage#