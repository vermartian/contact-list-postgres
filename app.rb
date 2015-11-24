require "sinatra"
require "pg"

configure :development do
  set :db_config, { dbname: "contact_list_development" }
end

configure :test do
  set :db_config, { dbname: "contact_list_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

FILENAME = "contact_list.txt"

get "/" do
  redirect "/contacts"
end

get "/contacts" do
  @contacts = File.readlines(FILENAME)
  erb :contacts
end

post "/contacts" do
  File.open(FILENAME, "a") do |f|
    f.puts params[:name]
  end
  redirect "/contacts"
end
