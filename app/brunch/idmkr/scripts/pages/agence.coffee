'use strict'

module.exports =
  id: 'fullpageAgence'
  anchors: [
    'home'
    'a1'
    'a2'
    'a3'
    'contact'
  ]
  sectionsColor: [
    '#050505'
    '#111111'
    '#151515'
    '#111111'
    '#050505'
  ]
  afterRender: ->
    $('video').get(0).play()
    $('select').material_select()