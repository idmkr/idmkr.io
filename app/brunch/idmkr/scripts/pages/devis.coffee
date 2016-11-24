'use strict'

module.exports =
    id: 'fullpageDevis'
    sectionsColor: [
        '#050505'
        '#111111'
        '#151515'
    ]
    afterRender: ->
        $('video').get(0).play()
        $('select').material_select()
        $('.datepicker').pickadate
            selectMonths: true
            selectYears: 2
        require("idmkr/form").bind '#form_project'