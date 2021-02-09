# About Project

This is a little project to show some skills.

<div style="text-align:center"><img src="https://homie.mx/assets/logos2.0/homie-rosa-200px.png" /></div>

## Getting Started
### Requirements
- Rails 6.1.1
- Ruby 3.0
- PostgreSQL 13.1
### Installing

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
If you run correctly the seed command you can use whatever of this users.

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
## Authors

* [Luis Osnet](https://luisosnet.com)