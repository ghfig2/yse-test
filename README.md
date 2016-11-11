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
```
$ cucumber email="name@site.com" password="12345678" 
```

or

```
$ cucumber email="name@site.com" password="12345678"  name="valid name" cpf="valid cpf" date_of_birth="dd/mm/yyyy"
```


