module ApplicationHelper
  def new_button(button_label, path, options={})
    options.merge!({type: 'button', class: 'btn btn-default', method: 'get', value: button_label, onclick: "location.href='#{path.to_s}'".html_safe})
    tag 'input', options
  end

  def edit_icon_link(path)
    link_to '<i class="fa fa-pencil"></i>'.html_safe, path
  end

  def delete_icon_link(delete_obj)
    link_to '<i class="fa fa-trash-o"></i>'.html_safe, delete_obj, method: :delete, data: { confirm: 'Are you sure?' }
  end

  def search_icon_link(song)
    link_to '<i class="fa fa-search"></li>'.html_safe, song.lyric_url, target: '_blank'
  end

  def table_css_classes
    'table table-striped table-bordered table-condensed'
  end
end
