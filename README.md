# About Project

This is a little project to show some skills.

<div style="text-align:center"><img src="https://homie.mx/assets/logos2.0/homie-rosa-200px.png" /></div>

## Getting Started
### Requirements
- Rails 6.1.1
- Ruby 3.0
- PostgreSQL 13.1
### Installing

Generate a secret key running the next command and then copy and paste the secret key into the `.env` file.
```
rails secret
```

It will easy just need to run the next commands after downloaded the project.

```
rails db:create db:migrate db:seed
```

after run migrations run the next command

```
bundle install
```

Now start the server

```
rails s
```

Now after run the server we'll use Postman to retrieve data and you can download the postman collection [here](https://drive.google.com/file/d/1WSXlxT_dVarDfkeQtHcB4Mwpux7t0lwv/view?usp=sharing).

### Authentication
If you run correctly the seed command you can use whatever of this users to login.

- Admin: Manage all
```
email: admin@example.com,
password: valid_password
```

- Partner: Read and Write just for a specific method to retrieve data.
```
email: partner@example.com,
password: valid_password
```
- Visitor: Read
```
email: visitor@example.com,
password: valid_password
```

In the previous request (login) we expect to receive a Status: 200, and all the information from the database for that particular users.

<div style="text-align:center"><img src="https://luisosnet.com/wp-content/uploads/2021/02/login.png" /></div>

Now you need to copy the authorization token that you can find it in the headers section or you could create a global variable too.

<div style="text-align:center"><img src="https://luisosnet.com/wp-content/uploads/2021/02/token.png" /></div>

After set up the previous token you can retrieve the correct data from any endpoint.

<div style="text-align:center"><img src="https://luisosnet.com/wp-content/uploads/2021/02/properties-1.png" /></div>

## Authors

* [Luis Osnet](https://luisosnet.com)