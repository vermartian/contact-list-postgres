## System Check Practice

## To clone down:

* Run this in your terminal: `git clone git@github.com:EliseFitz15/contact-list-postgres.git`
* Then go into the directory `cd contact-list-postgres`
* `bundle` then `rspec`
* Work through the test errors

##### When finished it you would like to push this to your github do the following:

* In the terminal: `git remote rm origin`
* Go to Github and set up your own repo
* Terminal: `git remote add origin <your-remote-repo-url>`
* Then add and push your own work.
  - `git add .`
  - `git commit -m "initial commit"`
  - `git push origin master`

### Instructions

Convert this contacts list app to read and write information to a PostgreSQL database instead of a TXT file.

### Getting Set Up

* Install the necessary dependencies: `bundle`
* Create a database called `contact_list_development`.
* Define your tables in a `schema.sql` file.
* Create tables by running `psql contact_list_development. < schema.sql` at the command line.
* Start the server: `ruby app.rb`

### Requirements Necessary to Meet Expectations

* Visiting `GET /contacts` should display the index page for a list of contacts. This page should contain a contacts read from the database, as well as a form for adding a new contact name.
* The name of each contact must be in [an `<li>` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li)
* The form to add a new contact requires the name be specified.
* If the contact name is left blank when the form is submitted...
  - A new contact record **should NOT** be saved to the database.
  - The user should see the index page for contacts.
* The form should submit to `POST /contacts`, which will save the new contact to the database.
* Modify your app so contacts have skills. Modify your `schema.sql` file to create a new table for skills. Feel free to add a `DROP TABLES` line, so you can re-run your schema repeatedly.
* Create a `data.sql` file. Write SQL statements to insert a contact, as well as insert two or more skills for that contact  in the `data.sql` file. Add these records to the database by running the following command: `psql contact_list_development < data.sql`
* Clicking on a contact name takes you to `GET /contacts/:id`.
* Visiting `GET /contacts/:id` should display the name of the contact and a list of skills that contact has.
* The list of skills **must** be retrieved using a SQL `JOIN` statement.

Acceptance tests have been written for you that cover these requirements. Run `rspec` to run the test suite and implement code to make these tests pass.

### Tips

* To meet expectations, all the requirements specified above must be met. It is possible to make all the tests pass, but not satisfy the requirements above, so please double-check the requirements once you are done.
* If your rspec tests are failing, read the test files themselves closely. Make sure your schema names the table columns in the same way that the test is trying to read them.
