require 'open-uri'

module ApplicationHelper
    def valid_image_url?(url)
        return false unless url.present?

        begin
            URI.open(url).read
            true
        rescue OpenURI::HTTPError, Errno::ENOENT, SocketError
            false
        end
        end
end
