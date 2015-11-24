require "spec_helper"

feature "user views skills" do
  scenario "see name of contact on contact person's show page" do
    db_connection do |conn|
      sql_query_1 = "INSERT INTO contacts (name) VALUES ($1)"
      data_1 = ["MLG"]
      conn.exec_params(sql_query_1, data_1)
    end

    visit "/contacts"
    click_link "MLG"

    expect(page).to have_content("MLG")
  end

  scenario "see skills on contacts show page" do
    db_connection do |conn|
      sql_query_1 = "INSERT INTO contacts (name) VALUES ($1)"
      data_1 = ["Alex"]
      conn.exec_params(sql_query_1, data_1)

      sql_query_2 = "SELECT * FROM contacts WHERE name = $1"
      data_2 = ["Alex"]
      contact_id = conn.exec_params(sql_query_2, data_2).first["id"]

      sql_query_3 = "INSERT INTO skills (description, contact_id) VALUES ($1, $2)"
      data_3 = ["Nae Nae-ing", contact_id]
      conn.exec_params(sql_query_3, data_3)
    end

    visit "/contacts"
    click_link "Alex"

    expect(page).to have_content("Nae Nae-ing")
  end
end
