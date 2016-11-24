Map = require('idmkr/map')

# Pour ne pas scroller sans faire expres à la fin d'un projet
canLeaveSection = true

module.exports =
    id: 'fullpageIndex'
    scrollOverflow: true

    sectionsColor: [
        '#050505'
        '#111111'
        '#151515'
        '#111111'
        '#050505'
    ]
    afterRender: ->

        $.each ['conseil', 'crea', 'launch'], (i, which) ->
            # Change backgrounds on hover
            $('.' + which)
                .mouseover ->
                    $('#' + which + '.mask-bgrd').addClass 'showed'
                .mouseout ->
                    $('#' + which + '.mask-bgrd').removeClass 'showed'

        ###
        # En cliquant sur le menu on override l'autorisation de quitter la section
        ###
        $('.main-nav').mousedown ->
            canLeaveSection = true

        ###
        # Flip the button!
        ###
        $('.btn-flip').click ->
            $(this).children('.btn-flip-container').toggleClass 'flipped'

    # Custom event not fired by fullPage.js
    afterPageLoad: ->
        $('video').get(0)?.play()
        Map.create this
        AnimatedHeadline.init()

    onLeave: (index, nextIndex, direction) -> canLeaveSection

    onSlideLeave: (anchorLink, index, slideIndex, direction, nextSlideIndex) ->
        canLeaveSection = anchorLink isnt 'clients' or index isnt 4 or nextSlideIndex is 0
        true