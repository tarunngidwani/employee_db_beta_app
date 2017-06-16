# README

## Employee DB: Alpha Release, v0.0.1

### Description
Employee DB is a record keeping application. It provides the ability to enter and store the name and full postal address   of an employee within an organization. Can easily be modified to meet various use cases. For example, recording volunteer or customer information.

### Features:

- View all records

- Create new records

- Edit existing records

- Delete existing records

### Setup

This README documents whatever steps are necessary to get the
application up and running.

* Ruby version

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **ruby 2.4.1p111 (2017-03-22 revision 58053)**

* System dependencies

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This application has been tested and supports running on Linux, MAC OSX, and UNIX-based operating systems.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Note:** In theory, this application should work on Windows but proceed with caution at your own risk

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Uses the **bundler** gem to install and manage dependencies required to use this application.

                                      1. gem install bundler
                                      2. git clone employee_db_alpha_app
                                      3. cd employee_db_alpha_app
                                      4. bundle install

* Database creation & initialization
    1. `rails db:drop`
        - Destroys any existing databases within this application
    2. `rails db:setup`
        - Creates the required databases, tables, and populates it with the specified seed data

* How to run the test suite
    - `rails test:models`
        - Runs all the unit tests for the models of the application

    - `rails test:controllers`
        - Runs all the functional tests for the controllers of the application

    - `rails test`
        - Runs the complete suite of tests for the application

* Starting the application
    - `rails server`
        - Starts the application in the development environment, running on:
        http://127.0.0.1:3000

        - Enter this URL in your browser to begin using the application

### Author
For any questions, comments and/or feedback please feel free to contact the author

Name: Tarun Gidwani

Email: tgidwani@hawk.iit.edu
