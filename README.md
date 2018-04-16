# Motley Fool DevOps Skills Test
Welcome to the TMF skills test! Below you will find guidelines for creating a .Net API endpoint and a Django app that consumes the created API endpoint. Complete as much as you can within 8-10 hours and start where you are most comfortable. Everything you need to get started is in this repo or outlined below in README.md. If you have questions about the project or get stuck you can message us in your slack channel. 

Have fun, and thank you for taking the time to complete this skills test. We will schedule your in-person interview after we have received your submission on GitHub. We are looking forward to discussing your experience and challenges!

Submit your work on a GitHub repo and include the necessary code, scripts, files and instruction to run the apps locally.

# .Net Project
Create a rest API endpoint in .Net using C#. Use the two scripts in the `dot-net\db-scripts` directory as a starting point for the schema and seed data. The schema presented here is a simple version of a basic commerce system. This .Net API will be used as a backend for the Django project outlined below. 

## Project Guidelines
* You may use any database technology you want (though the initial schema/seed scripts are written for sql server), any scaffolding tools, any ORM, etc.  
* Feel free to modify the schema but make sure not to omit any data that is currently being captured in the existing schema. For example, if you so choose you can modify the product table, but a product must always have a `ProductId`, `Name`, etc.
* A boilerplate Web API project has been included at `dot-net\webAPI`. Feel free to use this as a starting point if you choose.
* Include any relevant instructions or scripts to get the project up and running on a Windows 10 machine with Visual Studio 2017 Community or Pro.  You may assume that an instance of SQL Express 2014 is installed on the box.

### Items to note:
* The order table is sparse. You do not need to be concerned with capturing any data (credit cards etc).  But feel free to enhance the schema with any fields you might think a commerce system would need.
* If you choose to use a database other than SQL Server please make sure to include any relevant setup instructions.

# Django app
Create a Django project that uses the Commerce .Net API endpoint you created above. Display Commerce data of your choice in a simple Django view.

Then provide an automated way to run the projects in local development. Should be able to start from a blank environment and end with a running, functional app.

If you are not familiar with the Django platform we have provided a link below to documentation that will help get you started.
https://docs.djangoproject.com/en/2.0/intro/tutorial01/

# Skills test evaluation criteria
* .Net Framework usage
* URL/REST Structure
* Database/ORM use
* Running/Working on dual platform (.Net and Django) in development
* Automation or tools used to help with local setup
* Anything you did to make the applications your own

Again, thank you for taking the time to complete this skills test, have fun, and complete as much as you can in 8-10 hours.