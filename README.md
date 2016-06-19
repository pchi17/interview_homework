# Edmodo Interview Homework

# To Run the application

* This app is built using Ruby 2.3.1
* Make sure Bundler is installed.

* I use Postgres for my local dev environment. However, this app should work with similar databases.
* To set up the database, run

```console```
bundle install
rake db:reset
```

This will set up the database and it also create 2 users: 'philip' and 'mike'.

To start the web server, run

```console```
bundle exec rails server
```

Open your web browser and go to http://localhost:3000

* You can log in as a teacher by using 'philip' as the username.
* I have generated a sequence of users, their usernames have the format 'student_x', where x is a number.
For example, you can log in as a student by using 'student_0' as the username.
