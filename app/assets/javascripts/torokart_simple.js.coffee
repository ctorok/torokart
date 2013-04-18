# window.app =
#   filter = ''
#   handler = undefined

#   # Capture filter click events
#   $("#filters li").click onClickFilter

#   # Do initial update (shows all items)
#   updateFilters()

#   ready: ->
#     # Prepare layout options.
#     options =
#       autoResize: true # This will auto-update the layout when the browser window is resized.
#       container: $("#main") # Optional, used for some extra CSS styling
#       offset: 2 # Optional, the distance between grid items
#       itemWidth: 210 # Optional, the width of a grid item

#   refresh: ->
#     # This hides all grid items ("inactive" is a CSS class that sets opacity to 0).
#     $("#tiles li").addClass "inactive"

#     # Create a new layout selector with our filter.
#     handler = $(filter)

#     # This shows the items we want visible.
#     handler.removeClass "inactive"

#     # This updates the layout.
#     handler.wookmark options

#   updateFilters: ->
#     oldFilter = filter
#     filter = ""
#     filters = []

#     # Collect filter list.
#     lis = $("#filters li")
#     i = 0
#     length = lis.length
#     li = undefined
#     while i < length
#       li = $(lis[i])
#       filters.push "#tiles li." + li.attr("data-filter")  if li.hasClass("active")
#       i++

#     # If no filters active, set default to show all.
#     filters.push "#tiles li"  if filters.length is 0

#     # Finalize our filter selector for jQuery.
#     filter = filters.join(", ")

#     # If the filter has changed, update the layout.
#     refresh()  unless oldFilter is filter

#   onClickFilter: (e) ->
#     item = $(e.currentTarget)
#     item.toggleClass "active"
#     updateFilters()

# $(document).ready(app.ready)
$(document).ready new ->

  # This filter is later used as the selector for which grid items to show.
  filter = ""
  handler = undefined

  # Prepare layout options.
  options =
    autoResize: true # This will auto-update the layout when the browser window is resized.
    container: $("#main") # Optional, used for some extra CSS styling
    offset: 2 # Optional, the distance between grid items
    itemWidth: 210 # Optional, the width of a grid item


  # This function filters the grid when a change is made.
  refresh = ->

    # This hides all grid items ("inactive" is a CSS class that sets opacity to 0).
    $("#tiles li").addClass "inactive"

    # Create a new layout selector with our filter.
    handler = $(filter)

    # This shows the items we want visible.
    handler.removeClass "inactive"

    # This updates the layout.
    handler.wookmark options


  ###
  This function checks all filter options to see which ones are active.
  If they have changed, it also calls a refresh (see above).
  ###
  updateFilters = ->
    oldFilter = filter
    filter = ""
    filters = []

    # Collect filter list.
    lis = $("#filters li")
    i = 0
    length = lis.length
    li = undefined
    while i < length
      li = $(lis[i])
      filters.push "#tiles li." + li.attr("data-filter")  if li.hasClass("active")
      i++

    # If no filters active, set default to show all.
    filters.push "#tiles li"  if filters.length is 0

    # Finalize our filter selector for jQuery.
    filter = filters.join(", ")

    # If the filter has changed, update the layout.
    refresh()  unless oldFilter is filter


  ###
  When a filter is clicked, toggle it's active state and refresh.
  ###
  onClickFilter = (event) ->
    item = $(event.currentTarget)
    item.toggleClass "active"
    updateFilters()


  # Capture filter click events.
  $("#filters li").click onClickFilter

  # Do initial update (shows all items).
  updateFilters()
