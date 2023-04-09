class UrlValidation < ActiveModel::Validator
  def validate(record)
    if url_valid?(record[:url_callback])
      record.errors.add :base, 'Url invalid'
    end
  end

  private

  def url_valid?(url)
    url.start_with? 'http'
  end
end
