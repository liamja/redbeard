require 'redbeard'
require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

describe "Redbeard" do
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    context 'HTTP' do
        it 'has an Announce URI' do
            get '/announce'
            last_response.should be_ok
        end

        it 'has a Scrape URI' do
            get '/scrape'
            last_response.should be_ok
        end

        context 'Announce' do
            it 'responds with a content type of text/plain' do
                get '/announce'
                last_response.headers['Content-Type'].should == 'text/plain'
            end

            context 'Info Hash' do
                it 'accepts a valid Info Hash' do
                    get '/announce', {
                        :INFO_HASH => '640FE84C613C17F663551D218689A64E8AEBEABE',
                        :PORT => 6887,
                        :PEER_ID => "123"
                    }
                    last_request.params['INFO_HASH'].should == '640FE84C613C17F663551D218689A64E8AEBEABE'
                    # last_request.params['INFO_HASH'].bytesize.should == 20 * 2
                end
                
                it 'returns a Failure Reason if Info Hash is omitted' do
                    get '/announce', {
                        :INFO_HASH => nil,
                        :PEER_ID => "-BOWxxx-yyyyyyyyyyyy",
                        :PORT => 6887
                    }
                    last_response.body.should == {"failure reason" => "Info Hash is not specified."}.bencode
                end

                it 'rejects an Info Hash that is not 20 bytes' do
                    get '/announce', {:INFO_HASH => '640FE84C613C17F663551D218689A64E8AEBEABEDEADBEEF'}
                    last_response.should be_ok
                    last_response.body.should == {"failure reason" => "Info Hash is not 20 bytes."}.bencode
                end
            end

            context 'Peer ID' do
                it 'accepts a valid Peer ID' do
                    get '/announce', {:PEER_ID => "-BOWxxx-yyyyyyyyyyyy"}
                    last_response.body.should_not == {"failure reason" => "Peer ID is not 20 bytes."}.bencode
                end
                
                it 'returns a Failure Reason if Peer ID is omitted' do
                    get '/announce', {
                        :INFO_HASH => "640FE84C613C17F663551D218689A64E8AEBEABE",
                        :PEER_ID => nil,
                        :PORT => 6887
                    }
                    last_response.body.should == {"failure reason" => "Peer ID is not specified."}.bencode
                end

                it 'returns a Failure Reason if Peer ID is not 20 bytes' do
                    get '/announce', {
                        :INFO_HASH => "640FE84C613C17F663551D218689A64E8AEBEABE",
                        :PORT => 6887,
                        :PEER_ID => "123"
                    }
                    last_response.body.should == {"failure reason" => "Peer ID is not 20 bytes."}.bencode
                end
            end
        end

        it 'returns a Failure Reason if Port is omitted' do
            get '/announce', {
                :PORT => nil,
                :INFO_HASH => "640FE84C613C17F663551D218689A64E8AEBEABE",
                :PEER_ID => "-BOWxxx-yyyyyyyyyyyy"
            }
            last_response.body.should == {"failure reason" => "Port is not specified."}.bencode
        end
    end
end
