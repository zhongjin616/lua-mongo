Database
========

Methods
-------

### database:addUser(username, password, [roles], [extra])
Creates a new user with access to `database`. On error, returns `nil` and the error message.

### database:drop([options])
Drops `database` and returns `true`. On error, returns `nil` and the error message.

### database:getCollection(collname)
Returns a new [Collection] object.

### database:getCollectionNames()
Returns a list of the names of all collections in `database`. On error, returns `nil` and the error
message.

### database:getName()
Returns the name of `database`.

### database:hasCollection(collname)
Checks if a collection `collname` exists on the server within `database`. Returns `true` if the
collection exists or `nil` if it does not exist. On error, returns `nil` and the error message.

### database:removeAllUsers()
Removes all users from `database`. On error, returns `nil` and the error message.

### database:removeUser(username)
Removes a user from `database`. On error, returns `nil` and the error message.


[Collection]: collection.md
