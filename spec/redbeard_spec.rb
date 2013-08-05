require 'redbeard'
require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

describe "Redbeard" do
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    it 'has an Announce URI' do
        get '/announce'
        last_response.should be_ok
    end

    it 'has a Scrape URI' do
        get '/scrape'
        last_response.should be_ok
    end

    context 'Announce' do
        it 'accepts a valid Info Hash' do
            get '/announce', {:INFO_HASH => '640FE84C613C17F663551D218689A64E8AEBEABE'}
            last_request.params['INFO_HASH'].should == '640FE84C613C17F663551D218689A64E8AEBEABE'
            # last_request.params['INFO_HASH'].bytesize.should == 20 * 2
        end

        it 'rejects an Info Hash that is not 20 bytes' do
            get '/announce', {:INFO_HASH => '640FE84C613C17F663551D218689A64E8AEBEABEDEADBEEF'}
            last_response.should be_ok
            last_response.body.should == {"failure reason" => "Info Hash is not 20 bytes."}.bencode 
        end

        it 'responds with a content type of text/plain' do
            get '/announce'
            last_response.headers['Content-Type'].should == 'text/plain'
        end
    end
end
