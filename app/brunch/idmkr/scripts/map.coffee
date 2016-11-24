'use strict'

draw = (options) ->
  $mapCanvas = $('#' + options.id + ' #map-canvas')
  myLatlng = new google.maps.LatLng(43.7027822, 7.2778727)
  mapOptions =
    zoom: 17
    disableDefaultUI: true
    center: myLatlng
    styles: [
      {
        'featureType': 'water'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#252525' }
          { 'saturation': -100 }
          { 'lightness': -81 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'landscape'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#666666' }
          { 'saturation': -100 }
          { 'lightness': -55 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'poi'
        'elementType': 'geometry'
        'stylers': [
          { 'hue': '#555555' }
          { 'saturation': -100 }
          { 'lightness': -57 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'road'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#777777' }
          { 'saturation': -100 }
          { 'lightness': -6 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'administrative'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#cc9900' }
          { 'saturation': 100 }
          { 'lightness': -22 }
          { 'visibility': 'on' }
        ]
      }
      {
        'featureType': 'transit'
        'elementType': 'all'
        'stylers': [
          { 'hue': '#444444' }
          { 'saturation': 0 }
          { 'lightness': -64 }
          { 'visibility': 'off' }
        ]
      }
      {
        'featureType': 'poi'
        'elementType': 'labels'
        'stylers': [
          { 'hue': '#555555' }
          { 'saturation': -100 }
          { 'lightness': -57 }
          { 'visibility': 'off' }
        ]
      }
    ]

  map = new (google.maps.Map)($mapCanvas[0], mapOptions)

  marker = new (google.maps.Marker)(
    position: myLatlng
    map: map
    animation: google.maps.Animation.BOUNCE
    icon: '/img/pin.png')

  # Désactiver le scroll sur Google Maps
  $mapCanvas.css 'pointer-events', 'none'
  $mapCanvas.parent().click ->
    $mapCanvas.css 'pointer-events', 'auto'

  if options.afterMapCreate
    options.afterMapCreate.apply options, [ map ]

module.exports =
  create: (callback) ->
    if !google? or !google.maps?
      s = document.createElement('script')
      s.type = 'text/javascript'
      s.src = 'https://maps.google.com/maps/api/js?v=3&callback=gmap_draw'

      window.gmap_draw = ->
        draw callback

      $('head').append s

    else
      draw callback