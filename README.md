# Import in the sakila database
In your `bash`, type in:
```
mysql -u root < sakila-schema.sql
mysql -u root < sakila-data.sql
```

## Dependencies
```
yarn add express
yarn add hbs
yarn add wax-on
yarn add handlebars-helpers
yarn add mysql2
```

* `mysql2` allows NodeJS application to send SQL commands to MySQL
* What is the differences between `mysql` and `mysql2`: the latter supports promises and await/async