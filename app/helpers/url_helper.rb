module UrlHelper
  # @param [String] url
  def full_url(url)
    "#{request.protocol}#{request.host_with_port}#{url}"
  end
end