# MidtermProject

## Overview
- This is our week 10, midterm group project that encompasses most of what we have learned thus far in the course. This is also the First project in which we were tasked with forward engineering a multi table data base in mysql.
- Using the schema our group created a website where a user can search for local beers and bars in their area and specifically can look by their favorite name of beer and beer type.
- The website also allows the user to update their local bars tap list, providing crowdfunded information to keep bar menus up to date.


## Lessons used

- Object Relational mapping
- SQL database
- MAMP
- Spring bootstrap
- Object oriented programming
- JSTL
- JSP
- HTML
- HTTP session
- gradle
- Handling requests


## How to run - Instructions


- People who are beer enthusiasts can have a tendency to gravitate to certain breweries and their tap list. With that being said, we thought it would be a good idea to add a brewery table and that specific breweries list of beers in the database.
- With the same reasoning specified above. We added a Bar list to our database so beer enthusiasts are able to see exactly which beers to expect at any given location. the Bar list takes you to each bar's page which shows the bar's location, link to their website and a beer list with pricing for each beer carried.
- A user can look at the total list of the breweries in the data base, select a brewery and look at the list of beers that brewery has in the database
- When a user is logged in and in the bar list, they are able to add a bar to the data base. When you select a bar the user is able to add and remove beers from the menu and is able to update the bar information.
- While viewing a breweries list of beers, a user can select a beer on that list, look at the details of that beer and can also see the bars in the users area that have that beer on tap.
- If a user is logged in and has a profile, the user can update the brewery, update its beer list, and can also add a brewery to the database if they don't see a brewery that is present in the database but is present at their local bar
- Because this is a user focused website, we added the reviews feature
- If a user is logged in they have the ability to add a star rating and a text review of either a beer or a bars
- in addition, users can look at the totality of a beers/bars reviews by clicking on the average star rating link below the name of the beer/bars
