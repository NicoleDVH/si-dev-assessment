require 'twilio-ruby'

account_sid = "AC07e423b83cf54ba92a9e5ed363200d93" 
auth_token = "{{ 5752d00f2a6b96c2f1f9d2f620efb28e }}"   

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Hello from Ruby",
    :to => "+9086162378",    
    :from => "+7325322128")  
    
puts message.sid
