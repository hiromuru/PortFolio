#= require active_admin/base

$ ->
    $('a.has_many_remove').parent().remove()
    $('a.has_many_remove').remove()
    