require 'sinatra'
require 'uri'

before do
    headers "Content-Type" => "text/plain"
end

get '/announce' do
    unless params['INFO_HASH'].nil?
        if params['INFO_HASH'].bytesize != 40 
            halt "#{{"failure reason" => "Info Hash is not 20 bytes."}.bencode}"
        end
    end
end

get '/scrape' do
    
end
