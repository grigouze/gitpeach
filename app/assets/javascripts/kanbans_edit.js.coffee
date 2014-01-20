refresh_table = ->
  $("tr.edit_label").each ->
    is_backlog = $(this).find("input[name='labels[][is_backlog_issue]']").is(':checked')
    is_close   = $(this).find("input[name='labels[][is_close_issue]']").is(':checked')

    if is_backlog || is_close
      # disabled
      $(this).find("input[name='labels[][gitlab_label]']").attr('disabled','disabled')
    else
      # enabled
      $(this).find("input[name='labels[][gitlab_label]']").removeAttr('disabled')

$(document).ready ->
  $(".help-tooltip").tooltip()
  refresh_table()

  $("tr.edit_label input:radio").change ->
    refresh_table()

  $("tr.edit_label button.delete_label").click ->
    $(this).parents("tr.edit_label").remove()

  # clear old radio button
  $("input[name='labels[][is_backlog_issue]']").click ->
    that = this
    $("input[name='labels[][is_backlog_issue]']").each ->
      $(this).removeAttr("checked") unless that == this

  $("input[name='labels[][is_close_issue]']").click ->
    that = this
    $("input[name='labels[][is_close_issue]']").each ->
      $(this).removeAttr("checked") unless that == this
