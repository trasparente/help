###
  KeyboardJs
  Esc: reset
  mode=0: digit section id, Enter: switch to mode=1
  mode=1: digit article class, Enter: reset
###
keyboard = {
  section: ""
  article: ""
  mode: 0
  init: () ->
    # Bind events and reset
    keyboardJS.bind "", (e) -> keyboard.pressed e.key
    keyboard.reset()
    true
  reset: () ->
    keyboard.section = ""
    keyboard.mode = 0
    keyboard.article = ""
    $("section, article").each () -> @.style.display = "block"
    $("#display_commands").html ""
    true
  update: () ->
    if keyboard.section.length
      $("section:not([id*='#{keyboard.section}'])").each () -> @.style.display = "none"
      $("section[id*='#{keyboard.section}']").each () -> @.style.display = "block"
    else $("section").each () -> @.style.display = "block"
    if keyboard.article.length
      $("article:not([class*='#{keyboard.article}'])").each () -> @.style.display = "none"
      $("article[class*='#{keyboard.article}']").each () -> @.style.display = "block"
    else $("article").each () -> @.style.display = "block"
    # Update display
    $("#display_commands").html "#{keyboard.section} / #{keyboard.article}"
    true
  pressed: (key) ->
    # Escape to reset
    if key is "Escape"
      keyboard.reset()
    # Enter to switch mode or reset
    else if key is "Enter"
      switch keyboard.mode
        when 1 then keyboard.reset()
        when 0 then keyboard.mode = 1
    # Backspace pressed, slice string and update view
    else if key is "Backspace"
      switch keyboard.mode
        when 0 then keyboard.section = keyboard.section.slice 0, -1
        when 1 then keyboard.article = keyboard.article.slice 0, -1
      keyboard.update()
    # Normal key pressed, add key and update view
    else if key.length is 1 and key isnt " "
      switch keyboard.mode
        when 0 then keyboard.section += key
        when 1 then keyboard.article += key
      keyboard.update()
    true
}
