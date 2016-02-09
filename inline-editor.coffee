@InlineEditor = {}
@InlineEditor.isEditing = (id) ->
  Session.equals "isEditing-#{id}", true

@InlineEditor.setEditing = (id, isEditing) ->
  Session.set "isEditing-#{id}", isEditing

Template.InlineEditor.helpers
  isEditing: ->
    id = @_id || @uuid
    InlineEditor.isEditing id

Template.InlineEditor.events
  "click .edit": (e, tmpl) ->
    obj = tmpl.data
    id = obj._id || obj.uuid
    InlineEditor.setEditing id, true

  "click .cancel": (e, tmpl) ->
    obj = tmpl.data
    id = obj._id || obj.uuid
    InlineEditor.setEditing id, false

  "click .submit": (e, tmpl) ->
    obj = tmpl.data
    id = obj._id || obj.uuid
    InlineEditor.setEditing id, false
