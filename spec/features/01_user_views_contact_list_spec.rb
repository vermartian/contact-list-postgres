require "spec_helper"

feature "user views contacts list" do
  scenario "sees contacts names" do
    db_connection do |conn|
      sql_query = "INSERT INTO contacts (name) VALUES ($1)"
      data = ["Kevin"]
      conn.exec_params(sql_query, data)
    end

    visit "/contacts"
    expect(page).to have_content("Kevin")
  end
end
