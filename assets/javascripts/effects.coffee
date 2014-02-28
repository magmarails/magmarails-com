$(document).ready ->

  Offset = window.screen.width
  $('#main-menu').css('right', Offset)

  $(window).bind "orientationchange", ->
    Offset = window.screen.height + 8
    deactivateTransitions()
    if isMainMenuOpen()
      $('body').css('left', Offset)
    else
      $('#main-menu').css('right', Offset)

  $('#btn-mobile-header').click ->
    showMobileMenu()

  $('#menu').click ->
    showMobileMenu()

  $('#btn-menu').click ->
    hideMobileMenu()

  isMainMenuOpen = ->
    $('#main-menu').css('right') is '0px'

  hideMobileMenu = ->
    activateTransitions()
    $('body').css
      'left': '0'
      'overflow': 'visible'
    $('#main-menu').css('right', Offset)

  showMobileMenu = ->
    activateTransitions()
    $('#main-menu').css('right', '0')
    $('body').css
      'left': Offset
      'overflow': 'hidden'

  deactivateTransitions = ->
    $('body').css('transition-duration', '0s')
    $('#main-menu').css('transition-duration', '0s')

  activateTransitions = ->
    $('body').css('transition-duration', '0.3s')
    $('#main-menu').css('transition-duration', '0.3s')

  # Popup
  $('.open_popup').click (e) ->
    e.preventDefault()
    $('#popup').fadeIn()
    $('#policy').slideToggle()

  close_popup = ->
    $('#popup').fadeOut()
    $('#policy').slideToggle()

  $('.close_popup').click (e) ->
    e.preventDefault()
    close_popup()

  $(@).keyup (e) ->
    if (event.which == 27) and ($('#policy').is(':visible'))
      close_popup()

  $('.speaker-box').bind 'touchstart', (ev) ->
    this.classList.toggle('hover')
