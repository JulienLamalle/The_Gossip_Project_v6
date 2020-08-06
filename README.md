Project realized by Julien Lamalle for THP.

This web application is an application gathering gossip published by users that we generated in our database initially. 

We have now added the possibility to create an account, to create a gossip, to edit it, to delete it, it is the same for comments

A comment or a gossip cannot be edited or deleted only by their creators.

To read a gossip and see the comments linked to it you must have an account and be logged in ...

The used version of Ruby is 2.5.1, for Rails we used version 5.2.4.3

If your versions are different, you can use the command :

```
rm gemfile.lock
```

To launch the project, consider making a

```
bundle install
```
```
rails db:seed
```
```
rails s
```

Now you can go to :

```
http://localhost:3000/index
```


