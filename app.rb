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

def contacts_all
  db_connection do |conn|
    sql_query = "SELECT * FROM contacts"
    conn.exec(sql_query)
  end
end

def add_contact(params)
  db_connection do |conn|
    sql_query = "INSERT INTO contacts (name) VALUES ($1)"
    data = [params[:id]]
    conn.exec_params(sql_query, data)
  end
end

def skills_contact
  db_connection do |conn|
    sql_query = "SELECT contacts.*, skills.* FROM contacts
      LEFT JOIN skills ON contacts.id = skills.contact_id WHERE contacts.id = '#{params[:id]}'"
    conn.exec(sql_query)
  end
end

get "/" do
  redirect "/contacts"
end

get "/contacts" do
  @contacts = contacts_all
  erb :contacts
end

get "/contacts/:id" do
  unless skills_contact.to_a.empty?
    @contact = skills_contact[0]["name"]
    skills = []
    skills_contact.each do |skill|
      skills << skill["description"]
    end
    @skills = skills
  end
  erb :show
end


post "/contacts" do
  unless params[:id].strip.empty?
    add_contact(params)
  end
  redirect "/contacts"
end
