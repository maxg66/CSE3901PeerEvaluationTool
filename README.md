Final Project - Ruby on Rails Due: 12/1 The Foodies: Lauren Saggar, Abha Naik, Maxwell Giffin, Tejas Venkatachalam

The slides for the final presentation can be found here: https://docs.google.com/presentation/d/1Spy60xTi8gw8XyjuiH9iclIVtR2H-ExIY7_IVqcjg30/edit?usp=sharing

Summary: This project creates an platform that allows a user to submit scores for their teammates over the course of several projects. The platform also allows for an administrative view. From this view, an admin has the option to create students (i.e. assign usernames, emails and passwords), create and name groups, as well as view the scores that have been given to students by their peers. 

The platform has a login page which allows differentiation between students and admin, and authenticates the inputted username and password. 

The user view then proceeeds to a project page that lists the projects the student is assigned. After clicking on the desired project, the student is led to a group page that has the group they were assigned to for that particular project, as well as a list of the other students in their project group. The student can now select the individual members of thier group and has the option to evaluate their peers on a given scale.  

The administrator's view, after login, leads them to a project page which lists the the current projects that are assigned. The administrator has the option here of creating new projects for their class. From this page the admin can either route to a page that allows them to create new users and groups or click on a project which will lead them to the groups that exist for that particular project. They can then click into a group a see the students that are in the respective group. Finally, the administrator can click on a students name which will allow them to see the evaluations the student was given by their peers.

To create this site, we used the Ruby on Rails Tutorial by Michael Hartl to set up the skeleton of the page, and further styled it with Bootstrap and CSS. 


The test files for this project are located in the test folder and test cases have been created for the controllers and models 
The test can be run using the command below

```
$ rails test

```
Instructions:

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, run a yarn check:

```
$ yarn install --check-files
```

Next, migrate the database:

```
$ rails db:migrate
```

Then, fetch the seed file

```
$ rails db:seed
```
You are now ready to run the app in a local server:

```
$ rails server
```
From here you can either login as a student or an administrator using the credentials below and explore the evalutation page!

Initial Admin Login
U: admin.1@osu.edu
P: admin1pass