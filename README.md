# yse-test

## Using:
* Ruby
* Cucumber
* Capybara (+ selenium webdriver)
* Site_prism
* Faker


## How to run

### Installing dependencies:
```
$ bundle install
```

### Running tests:

* email and password are mandatory
* use a new e-mail
* password > 7 characters
* name, cpf and date_of_birth are optional but the last step requires real data to pass

```
$ cucumber email="name@site.com" password="12345678" 
```

or

```
$ cucumber email="name@site.com" password="12345678"  name="valid name" cpf="valid cpf" date_of_birth="dd/mm/yyyy"
```


