'use strict'

_uri = null
_this =
    get : -> _uri
    detect : -> window.location.pathname
    set : (uri) -> _uri = uri || @detect()
_this.set()

module.exports = _this