class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateUser.call(normalized_email, params[:password])

   if command.success?
     res = command.result
     if params[:include_profile]
       render json: { auth_token: res[:token], profile: res[:profile] }
     else
       render json: { auth_token: res[:token] }
     end
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end

 private

 def normalized_email
   params[:email].to_s.strip.downcase
 end
end
