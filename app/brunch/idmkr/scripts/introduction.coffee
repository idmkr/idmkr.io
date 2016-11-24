'use strict'

background = document.getElementById 'intro-bgrd'
container = document.getElementById 'intro-container'

module.exports =
    init: (text) ->
        # initial animation
        container.className = 'intro-container loading'
        background.className = 'mask-bgrd showed'

        if text
            $('.intro-header').append '<h2>' + text + '</h2>'

    hide: (callback) ->
        $ container
        .removeClass 'loading'
        .addClass 'loaded'
        .one 'webkitAnimationEnd oanimationend msAnimationEnd animationend', ->
            $('.intro-loader').remove()
            callback() if callback