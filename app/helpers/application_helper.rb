module ApplicationHelper
  def new_button(button_label, path, options={})
    options.merge!({type: 'button', class: 'btn btn-outline-secondary btn-sm', method: 'get', value: button_label, onclick: "location.href='#{path.to_s}'".html_safe})
    tag 'input', options
  end

  def edit_icon_link(path)
    link_to path, class: 'span' do
      tag.i class: 'bi bi-pencil-fill'
    end
  end

  def delete_icon_link(delete_obj)
    link_to delete_obj, data: { turbo_method: :delete, turbo_confirm: "本当に削除しますか？" }, class: 'span' do
      tag.i class: 'bi bi-trash'
    end
  end

  def search_icon_link(song)
    link_to song.lyric_url, target: '_blank', class: 'span' do
      tag.i class: 'bi bi-search'
    end
  end

  def table_css_classes
    'table table-striped table-bordered table-sm'
  end

  def turbo_stream_flash
    turbo_stream.update "flash", partial: "flash"
  end
end
