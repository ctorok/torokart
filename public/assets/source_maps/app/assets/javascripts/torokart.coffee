$(document).ready new ->

  # Prepare layout options.
  options =
    autoResize: true # This will auto-update the layout when the browser window is resized.
    container: $("#main") # Optional, used for some extra CSS styling
    offset: 2 # Optional, the distance between grid items
    itemWidth: 210 # Optional, the width of a grid item


  # Get a reference to your grid items.
  handler = $("#tiles li")

  # Call the layout function.
  handler.wookmark options

  # Capture clicks on grid items.
  handler.click ->

    # Randomize the height of the clicked item.
    newHeight = $("img", this).height() + Math.round(Math.random() * 300 + 30)
    $(this).css "height", newHeight + "px"

    # Update the layout.
    handler.wookmark()
