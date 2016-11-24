'use strict'

module.exports =
    create: (options) ->
        if $.fn.fullpage.destroy
            try
                $.fn.fullpage.destroy 'all'
            catch e then console.log e

        $('#' + options.id).fullpage $.extend({
            menu: '.main-nav'
            scrollingSpeed: 450
        }, options)

        $('#' + options.id + ' .button-collapse').sideNav()

        options.afterPageLoad?.apply options

        $.fn.fullpage