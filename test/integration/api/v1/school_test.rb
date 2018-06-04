require 'test_helper'

feature "Schools" do
    describe "#index" do 
        it "return 401 if the user isn't login" do  
            get api_v1_schools_path
            assert_equal 401, last_response.status
        end
        it "return 401 is the token is invalid" do  
            get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => '12345AZERTY'}
            assert_equal 401, last_response.status
        end

        
        it "returns 200 when user is valid"  do  
            get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}
            assert_equal 200, last_response.status
            assert_equal 3, json_response['schools'].length
            assert_equal 'ECAM', json_response['schools'].first['name']
        end

        
        it "returns only private schools" do
            get api_v1_schools_path,
            {status: 'private'},
            {'HTTP_AUTHORIZATION' => 'valid_token'}

            assert_equal 2, json_response['schools'].length


        end

        
        it "returns only public schools" do
            get api_v1_schools_path,
            {status: 'public'},
            {'HTTP_AUTHORIZATION' => 'valid_token'}

            assert_equal 1, json_response['schools'].length
        end
    end


end


