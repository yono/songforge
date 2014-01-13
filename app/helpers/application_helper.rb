module ApplicationHelper

  def new_button(button_label, path)
    button_to button_label, path, class: 'btn', method: :get
  end

  def edit_icon_link(path)
    link_to '<i class="icon-pencil"></i>'.html_safe, path
  end

  def delete_icon_link(delete_obj)
    link_to '<i class="icon-trash"></i>'.html_safe, delete_obj, method: :delete, data: { confirm: 'Are you sure?' }
  end

  def table_css_classes
    "table table-striped table-bordered table-condensed"
  end
end
