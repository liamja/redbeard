require 'sinatra'
require 'uri'

before do
    headers "Content-Type" => "text/plain"
end

get '/announce' do
    unless params['INFO_HASH'].nil?
        if params['INFO_HASH'].bytesize != 40 
            raise 'INFO_HASH is not 20 bytes long.'
        end
    end
end

get '/scrape' do
    
end
