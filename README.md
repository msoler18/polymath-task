# Polymath Task App

## Print Screens

### Polymath Task App - Listing
![Polymath Task App - Listing](/app/assets/images/Polymath-Task-App_list.png "Polymath Task App - Listing")
### Polymath Task App - Create Task
![Polymath Task App - Create Task](/app/assets/images/Polymath-Task-App_add.png "Polymath Task App - Create Task")
### Polymath Task App - Register user
![Polymath Task App - Register user](/app/assets/images/Polymath-Task-App_register.png "Polymath Task App - Register user")

[Polymath task app](https://polymath-task.herokuapp.com/)


[Polymath task app - Explanation](https://www.loom.com/share/c32fe3cc06af46159b06f2a2d48aeb15)

## Install

### Clone the repository

```shell
git clone https://github.com/msoler18/polymath-task.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set environment variables

Using [Figaro](https://github.com/laserlemon/figaro):

See [config/application.yml.sample](https://github.com/juliendargelos/project/blob/master/config/application.yml.sample) and contact the developer: [msoler735@gmail.com](msoler735@gmail.com) (sensitive data).

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Add heroku remotes

Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a project
heroku git:remote --remote heroku-staging -a project-staging
```

## Serve

```shell
rails s
```

## Deploy

### With Heroku pipeline (recommended)

Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a project-staging
```

### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku
```