'use strict'

module.exports = (id) ->
  inClass = undefined
  outClass = undefined
  switch id
    when 1
      outClass = 'pt-page-moveToLeft'
      inClass = 'pt-page-moveFromRight'
    when 2
      outClass = 'pt-page-moveToRight'
      inClass = 'pt-page-moveFromLeft'
    when 3
      outClass = 'pt-page-moveToTop'
      inClass = 'pt-page-moveFromBottom'
    when 4
      outClass = 'pt-page-moveToBottom'
      inClass = 'pt-page-moveFromTop'
    when 5
      outClass = 'pt-page-fade'
      inClass = 'pt-page-moveFromRight pt-page-ontop'
    when 6
      outClass = 'pt-page-fade'
      inClass = 'pt-page-moveFromLeft pt-page-ontop'
    when 7
      outClass = 'pt-page-fade'
      inClass = 'pt-page-moveFromBottom pt-page-ontop'
    when 8
      outClass = 'pt-page-fade'
      inClass = 'pt-page-moveFromTop pt-page-ontop'
    when 9
      outClass = 'pt-page-moveToLeftFade'
      inClass = 'pt-page-moveFromRightFade'
    when 10
      outClass = 'pt-page-moveToRightFade'
      inClass = 'pt-page-moveFromLeftFade'
    when 11
      outClass = 'pt-page-moveToTopFade'
      inClass = 'pt-page-moveFromBottomFade'
    when 12
      outClass = 'pt-page-moveToBottomFade'
      inClass = 'pt-page-moveFromTopFade'
    when 13
      outClass = 'pt-page-moveToLeftEasing pt-page-ontop'
      inClass = 'pt-page-moveFromRight'
    when 14
      outClass = 'pt-page-moveToRightEasing pt-page-ontop'
      inClass = 'pt-page-moveFromLeft'
    when 15
      outClass = 'pt-page-moveToTopEasing pt-page-ontop'
      inClass = 'pt-page-moveFromBottom'
    when 16
      outClass = 'pt-page-moveToBottomEasing pt-page-ontop'
      inClass = 'pt-page-moveFromTop'
    when 17
      outClass = 'pt-page-scaleDown'
      inClass = 'pt-page-moveFromRight pt-page-ontop'
    when 18
      outClass = 'pt-page-scaleDown'
      inClass = 'pt-page-moveFromLeft pt-page-ontop'
    when 19
      outClass = 'pt-page-scaleDown'
      inClass = 'pt-page-moveFromBottom pt-page-ontop'
    when 20
      outClass = 'pt-page-scaleDown'
      inClass = 'pt-page-moveFromTop pt-page-ontop'
    when 21
      outClass = 'pt-page-scaleDown'
      inClass = 'pt-page-scaleUpDown pt-page-delay300'
    when 22
      outClass = 'pt-page-scaleDownUp'
      inClass = 'pt-page-scaleUp pt-page-delay300'
    when 23
      outClass = 'pt-page-moveToLeft pt-page-ontop'
      inClass = 'pt-page-scaleUp'
    when 24
      outClass = 'pt-page-moveToRight pt-page-ontop'
      inClass = 'pt-page-scaleUp'
    when 25
      outClass = 'pt-page-moveToTop pt-page-ontop'
      inClass = 'pt-page-scaleUp'
    when 26
      outClass = 'pt-page-moveToBottom pt-page-ontop'
      inClass = 'pt-page-scaleUp'
    when 27
      outClass = 'pt-page-scaleDownCenter'
      inClass = 'pt-page-scaleUpCenter pt-page-delay400'
    when 28
      outClass = 'pt-page-rotateRightSideFirst'
      inClass = 'pt-page-moveFromRight pt-page-delay200 pt-page-ontop'
    when 29
      outClass = 'pt-page-rotateLeftSideFirst'
      inClass = 'pt-page-moveFromLeft pt-page-delay200 pt-page-ontop'
    when 30
      outClass = 'pt-page-rotateTopSideFirst'
      inClass = 'pt-page-moveFromTop pt-page-delay200 pt-page-ontop'
    when 31
      outClass = 'pt-page-rotateBottomSideFirst'
      inClass = 'pt-page-moveFromBottom pt-page-delay200 pt-page-ontop'
    when 32
      outClass = 'pt-page-flipOutRight'
      inClass = 'pt-page-flipInLeft pt-page-delay500'
    when 33
      outClass = 'pt-page-flipOutLeft'
      inClass = 'pt-page-flipInRight pt-page-delay500'
    when 34
      outClass = 'pt-page-flipOutTop'
      inClass = 'pt-page-flipInBottom pt-page-delay500'
    when 35
      outClass = 'pt-page-flipOutBottom'
      inClass = 'pt-page-flipInTop pt-page-delay500'
    when 36
      outClass = 'pt-page-rotateFall pt-page-ontop'
      inClass = 'pt-page-scaleUp'
    when 37
      outClass = 'pt-page-rotateOutNewspaper'
      inClass = 'pt-page-rotateInNewspaper pt-page-delay500'
    when 38
      outClass = 'pt-page-rotatePushLeft'
      inClass = 'pt-page-moveFromRight'
    when 39
      outClass = 'pt-page-rotatePushRight'
      inClass = 'pt-page-moveFromLeft'
    when 40
      outClass = 'pt-page-rotatePushTop'
      inClass = 'pt-page-moveFromBottom'
    when 41
      outClass = 'pt-page-rotatePushBottom'
      inClass = 'pt-page-moveFromTop'
    when 42
      outClass = 'pt-page-rotatePushLeft'
      inClass = 'pt-page-rotatePullRight pt-page-delay180'
    when 43
      outClass = 'pt-page-rotatePushRight'
      inClass = 'pt-page-rotatePullLeft pt-page-delay180'
    when 44
      outClass = 'pt-page-rotatePushTop'
      inClass = 'pt-page-rotatePullBottom pt-page-delay180'
    when 45
      outClass = 'pt-page-rotatePushBottom'
      inClass = 'pt-page-rotatePullTop pt-page-delay180'
    when 46
      outClass = 'pt-page-rotateFoldLeft'
      inClass = 'pt-page-moveFromRightFade'
    when 47
      outClass = 'pt-page-rotateFoldRight'
      inClass = 'pt-page-moveFromLeftFade'
    when 48
      outClass = 'pt-page-rotateFoldTop'
      inClass = 'pt-page-moveFromBottomFade'
    when 49
      outClass = 'pt-page-rotateFoldBottom'
      inClass = 'pt-page-moveFromTopFade'
    when 50
      outClass = 'pt-page-moveToRightFade'
      inClass = 'pt-page-rotateUnfoldLeft'
    when 51
      outClass = 'pt-page-moveToLeftFade'
      inClass = 'pt-page-rotateUnfoldRight'
    when 52
      outClass = 'pt-page-moveToBottomFade'
      inClass = 'pt-page-rotateUnfoldTop'
    when 53
      outClass = 'pt-page-moveToTopFade'
      inClass = 'pt-page-rotateUnfoldBottom'
    when 54
      outClass = 'pt-page-rotateRoomLeftOut pt-page-ontop'
      inClass = 'pt-page-rotateRoomLeftIn'
    when 55
      outClass = 'pt-page-rotateRoomRightOut pt-page-ontop'
      inClass = 'pt-page-rotateRoomRightIn'
    when 56
      outClass = 'pt-page-rotateRoomTopOut pt-page-ontop'
      inClass = 'pt-page-rotateRoomTopIn'
    when 57
      outClass = 'pt-page-rotateRoomBottomOut pt-page-ontop'
      inClass = 'pt-page-rotateRoomBottomIn'
    when 58
      outClass = 'pt-page-rotateCubeLeftOut pt-page-ontop'
      inClass = 'pt-page-rotateCubeLeftIn'
    when 59
      outClass = 'pt-page-rotateCubeRightOut pt-page-ontop'
      inClass = 'pt-page-rotateCubeRightIn'
    when 60
      outClass = 'pt-page-rotateCubeTopOut pt-page-ontop'
      inClass = 'pt-page-rotateCubeTopIn'
    when 61
      outClass = 'pt-page-rotateCubeBottomOut pt-page-ontop'
      inClass = 'pt-page-rotateCubeBottomIn'
    when 62
      outClass = 'pt-page-rotateCarouselLeftOut pt-page-ontop'
      inClass = 'pt-page-rotateCarouselLeftIn'
    when 63
      outClass = 'pt-page-rotateCarouselRightOut pt-page-ontop'
      inClass = 'pt-page-rotateCarouselRightIn'
    when 64
      outClass = 'pt-page-rotateCarouselTopOut pt-page-ontop'
      inClass = 'pt-page-rotateCarouselTopIn'
    when 65
      outClass = 'pt-page-rotateCarouselBottomOut pt-page-ontop'
      inClass = 'pt-page-rotateCarouselBottomIn'
    when 66
      outClass = 'pt-page-rotateSidesOut'
      inClass = 'pt-page-rotateSidesIn pt-page-delay200'
    when 67
      outClass = 'pt-page-rotateSlideOut'
      inClass = 'pt-page-rotateSlideIn'

  {
    inClass: inClass
    outClass: outClass
  }