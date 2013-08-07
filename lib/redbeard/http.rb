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

    unless params['PEER_ID'].nil?
        if params['PEER_ID'].bytesize != 20 
            halt "#{{"failure reason" => "Peer ID is not 20 bytes."}.bencode}"
        end
    end
end

get '/scrape' do
    
end
