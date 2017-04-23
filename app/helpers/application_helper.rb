module ApplicationHelper
  def new_button(button_label, path, options={})
    options.merge!({type: 'button', class: 'btn btn-default', method: 'get', value: button_label, onclick: "location.href='#{path.to_s}'".html_safe})
    tag 'input', options
  end

  def edit_icon_link(path)
    link_to '', path, class: 'span glyphicon glyphicon-pencil'
  end

  def delete_icon_link(delete_obj)
    link_to '', delete_obj, method: :delete, data: { confirm: 'Are you sure?' }, class: 'span glyphicon glyphicon-trash'
  end

  def search_icon_link(song)
    link_to '', song.lyric_url, target: '_blank', class: 'span glyphicon glyphicon-search'
  end

  def table_css_classes
    'table table-striped table-bordered table-condensed'
  end
end
