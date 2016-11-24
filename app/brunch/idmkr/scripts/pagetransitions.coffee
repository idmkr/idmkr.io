'use strict'

getAnimClasses = require('idmkr/pagetransitions.getanimclasses')

$main = $('#pt-main')
$pages = null
animcursor = 1
pagesCount = 0
current = 0
isAnimating = false
endCurrPage = false
endNextPage = false
animEndEventNames =
    'WebkitAnimation': 'webkitAnimationEnd'
    'OAnimation': 'oAnimationEnd'
    'msAnimation': 'MSAnimationEnd'
    'animation': 'animationend'
animEndEventName = animEndEventNames[Modernizr.prefixed('animation')]
support = Modernizr.cssanimations

onEndAnimation = ($outpage, $inpage, options) ->
    endCurrPage = false
    endNextPage = false
    resetPage $outpage, $inpage, options
    isAnimating = false

resetPage = ($outpage, $inpage, options) ->
    $outpage.remove()
    $inpage.attr 'class', $inpage.data('originalClassList') + ' pt-page-current'
    options?.onEndAnimation?.apply(options)


module.exports =
    init: ->
        @refresh()

    refresh: ->
        $pages = $main.children('div.pt-page')
        pagesCount = $pages.length

        $pages.each ->
            $page = $(this)
            $page.data 'originalClassList', $page.attr('class')

        this

    nextPage: (options) ->
        animation = if $.isPlainObject(options) then options.animation else options

        if isAnimating then return false else isAnimating = true

        $currPage = $pages.eq(0)
        $nextPage = $pages.eq(1).addClass('pt-page-current')

        animClasses = getAnimClasses(animation)

        $currPage.addClass(animClasses.outClass).on animEndEventName, ->
            $currPage.off animEndEventName
            endCurrPage = true
            if endNextPage then onEndAnimation $currPage, $nextPage, options

        $nextPage.addClass(animClasses.inClass).on animEndEventName, ->
            $nextPage.off animEndEventName
            endNextPage = true
            if endCurrPage then onEndAnimation $currPage, $nextPage, options

        if support is off then onEndAnimation $currPage, $nextPage, options

        this

    loadPage: (uri, animation, pageOptions) ->
        _this = @

        if uri == '/'
            uri += 'index'

        $.get('/page' + uri).done (html)->
            uri = uri.replace('index', '')
            window.history.pushState
                html : html
                pageTitle : $('title').text()
            , "", uri
            $(window).trigger 'pagetransitions:urichanged', uri
            $('#pt-main').append html
            require('idmkr/fullpage').create(pageOptions).silentMoveTo(1)
            _this.refresh().nextPage animation

        .fail ->
            console.log("fail")