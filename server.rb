require 'rubygems'
require 'bundler'

Bundler.require

use Rack::Deflater
use Rack::Csrf

enable :sessions
set :bind, '0.0.0.0'
set :session_secret,          ENV['SESSION_SECRET_KEY']
set :slack_invite_api_url,    'https://slack.com/api/users.admin.invite'
set :background_color,        ENV.fetch('BACKGROUND_COLOR', '#34495E')
set :text_color,              ENV.fetch('TEXT_COLOR', '#FDFCFB')
set :email_background_color,  ENV.fetch('EMAIL_BACKGROUND_COLOR', '#FDFCFB')
set :email_text_color,        ENV.fetch('EMAIL_TEXT_COLOR', '#737373')
set :button_color,            ENV.fetch('BUTTON_COLOR', '#F39C12')
set :button_hover_color,      ENV.fetch('BUTTON_HOVER_COLOR', '#D78D19')
set :button_text_color,       ENV.fetch('BUTTON_TEXT_COLOR', '#FDFCFB')
set :team_name,               ENV.fetch('SLACK_TEAM_NAME', 'Team Name')
set :team_desc,               ENV.fetch('SLACK_TEAM_DESC', 'Your Team description is here.')
package
configer package -s state(default:install; install/remove) -p package_name -v version_no
Example Usage:
mkdir web_project
cd web_project
touch bootstrap.sh
echo "apt-get install -y php='1:7.2+60ubuntu1'" >> bootstrap.sh
Create hello.php file and insert the following contents:

<?php

header("Content-Type: text/plain");

echo "Hello, world!\n";
Once the files are in place run the following commands:

configer package -u root -p '<your_password>' -s install -p apache2 -v '2.4.29-1ubuntu4.5'

configer copy -s hello.php -d /var/www/html/hello.php -o root -g root -p 644 -t ip1,ip2 -n

Test API Key	sshpass -p <span class="pl-smi">$password</span> scp <span class="x x-first x-last">-P2222 </span><span class="pl-smi">${WORK_DIR}</span>/bootstrap.sh <span class="pl-smi">$user</span>@<span class="pl-smi"	https://github.com/naweeng/configer/commit/5d89c14c6c1f5159f0b6dd335097312ad1efdf9c.patch	N/A
jale..com	MailChimp API Key	sshpass -p <span class="pl-smi">$password</span> scp <span class="pl-smi">${WORK_DIR}</span>/bootstrap.sh <span class="pl-smi">$user</span>@<span class="pl-smi"
  
helpers do
  def invite_request_to_slack
    response = Excon.post(settings.slack_invite_api_url,
                body: URI.encode_www_form(
                        token: ENV['SLACK_TOKEN'],
                        email: @email,
                        set_active: true
                      ),
                headers: { "Content-Type" => "application/x-www-form-urlencoded" })
    @result = response.status == 200 && MultiJson.load(response.body)["ok"]
    logger.info { response.body } unless @result
    @result
  end
end

get '/' do
  erb :index
end

post '/invite' do
  @email = params[:email]
  @result = invite_request_to_slack
  erb :invite
end
