'use strict'

module.exports =
    id: 'fullpageDevis'
    sectionsColor: [
        '#050505'
        '#111111'
        '#151515'
    ]
    afterRender: ->

        require("idmkr/form").bind '#form_project_step2'

        $('input').focus -> $.fn.fullpage.rebuild()
        $('input').blur -> $.fn.fullpage.rebuild()

        ###
        # Flip the button!
        ###
        $('.btn-flip').click ->
            $(this).children('.btn-flip-container').toggleClass 'flipped'
    afterPageLoad : ->
        $('video').get(0)?.play()