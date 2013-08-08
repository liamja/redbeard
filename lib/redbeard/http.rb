require 'sinatra'
require 'uri'

before do
    headers "Content-Type" => "text/plain"
end

get '/announce' do
    if params[:INFO_HASH].nil?
        halt "#{{"failure reason" => "Info Hash is not specified."}.bencode}"
    else
        if params[:INFO_HASH].bytesize != 40 
            halt "#{{"failure reason" => "Info Hash is not 20 bytes."}.bencode}"
        end
    end

    unless params['PEER_ID'].nil?
        if params['PEER_ID'].bytesize != 20 
            halt "#{{"failure reason" => "Peer ID is not 20 bytes."}.bencode}"
        end
    end

    if params[:PORT].nil?
        halt "#{{"failure reason" => "Port is not specified."}.bencode}"
    end
end

get '/scrape' do

end
