require 'sinatra'
require 'uri'

get '/announce' do
    unless params['INFO_HASH'].nil?
        if params['INFO_HASH'].length != 40 
            raise 'INFO_HASH is not 20 bytes long.'
        end
    end
end

get '/scrape' do
    
end
