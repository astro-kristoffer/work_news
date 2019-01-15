module EsHelper
  def as_indexed_json(params={})
    {
      title: title,
      text: text
    }
  end

  def preview
    if text.size > 25
      text[0, 25] + '...'
    else
      text
    end
  end
end