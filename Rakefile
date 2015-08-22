require "dotenv"
require "pry"
require "httparty"
require 'json'
require 'cgi'

namespace :assets do
  task :precompile do
    sh 'middleman contentful --rebuild'
    sh 'middleman build'
  end
end

desc "Auto update cron job"
task :cron do

  Dotenv.load

  @content_url_base = "https://cdn.contentful.com/spaces/#{ENV['CONTENTFUL_SPACE']}/sync?"
  @content_url = "#{@content_url_base}access_token=#{ENV['CONTENTFUL_ACCESS_TOKEN']}".gsub(/\s+/, "")

  @source_url = "https://github.com/#{ENV['GIT_USER']}/
    #{ENV['GIT_REPO']}/archive/
    #{ENV['GIT_BRANCH']}.tar.gz".gsub(/\s+/, "")

  @build_url = "https://api.heroku.com/apps/#{ENV['HEROKU_APP']}/builds"
  sync_token_file = ".sync_token"

  if File.file?(sync_token_file)
    @sync_token = File.read(sync_token_file)
    response = HTTParty.get(@content_url+"&sync_token=#{@sync_token}")
  else
    FileUtils.rmdir 'data/site'
    response = HTTParty.get(@content_url+"&initial=true")
    intial_content = JSON.parse(response)
    @sync_token = CGI::parse(intial_content["nextSyncUrl"]
      .gsub(@content_url_base, ""))["sync_token"][0]
    File.open(sync_token_file, 'w') {|f| f.write(@sync_token) }
  end

  site_content = JSON.parse(response)

  if site_content["items"]

    build_options = {
      :body => {
            :source_blob => {
              :url => @source_url,
              :version => @sync_token
            }
          }.to_json,
      :headers => {
        "Accept" => "application/vnd.heroku+json; version=3",
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{ENV['HEROKU_AUTH']}"
      }
    }

    build_response = HTTParty.post(@build_url,build_options)

  end


end
