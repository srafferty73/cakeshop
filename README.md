# Cake Shop Inventory

A simple attempt to build a CRUD interface for a Cake Shop web server setup using Ruby with Sinatra and MiniTest.
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Working installations of:  
 * Ruby, 
 * Sinatra, 
 * PostGresSQL and 
 * MiniTest

### Installing

The full repo can easily be pulled into Atom or another similar text editor software.  There is no dependency of OS or processor requirements.  The interface has only been viewed in Chrome by me.

## Running the tests

There are a few simple tests to cater for initial creation values of a Cake object and a Manufacturer object.
These are found in the /specs folder and with MiniTest installed, these can be observed via ```ruby specs/cake_spec.rb``` and ```ruby specs/manufacturer_spec.rb``` respectively.
### Break down into end to end tests

Since this application is very minimal and basic, no further testing is provided.  Clearly, more thorough testing would be required if the application was to be developed further.

## Deployment

The application requires the following terminal/CLI steps to run:

* Using PostGresSQL, create a template database: ```createdb cakeshop```
* Populate that database with tables via ```psql -d cakeshop -f db/cakeshop.sql```
* Populate each table with initial data via ```ruby db/seeds.rb```
* Run the Sinatra web app via ```ruby app.rb``` 
* In Chrome, navigate to ```localhost:4567/```
* Using the various buttons at the bottom of the application, CRUD actions can be performed on the data displayed.

## Author

* **Stephen Rafferty**

## Acknowledgments

* Hat tip to Colin and Keith @ CodeClan, Edinburgh
* Inspiration
* etc
