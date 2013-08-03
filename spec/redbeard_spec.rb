require 'redbeard'
require 'rspec'
require 'rack/test'
require 'uri'

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
        it 'should accept an Info Hash' do
            get '/announce', {:INFO_HASH => '640FE84C613C17F663551D218689A64E8AEBEABE'}
            last_request.params['INFO_HASH'].should == '640FE84C613C17F663551D218689A64E8AEBEABE'
            # last_request.params['INFO_HASH'].bytesize.should == 20 * 2
        end

        it 'should reject an Info Hash that is not 20 bytes' do
            get '/announce', {:INFO_HASH => '640FE84C613C17F663551D218689A64E8AEBEABEDEADBEEF'}
            last_response.should_not be_ok
        end
    end
end
