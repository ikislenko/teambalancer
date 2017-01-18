app = angular.module('teambalancer', ["ngResource"])

# Factories
# ######################################
app.factory "User", ($resource) ->
  $resource("/users/:id", {id: "@id"}, {
    update: {method: "PUT"}
    delete: {method: "delete"}
    })

app.factory "Task", ($resource) ->
  $resource("/tasks/:id", {id: "@id"}, {
    update: {method: "PUT"}
    delete: {method: "delete"}
    })

app.factory "Rebalance", ($resource) ->
  $resource("/rebalance", {}, {show: {method: "GET"}})

app.factory "Clear", ($resource) ->
  $resource("/clear", {}, {show: {method: "GET"}})
# #####################################

# Filters
# ###################################
app.filter 'totalPoints', ->
  (input) ->
    result = 0
    angular.forEach input, ((value, key) ->
      result += value.story_points
    )
    result
# ####################################

#  Controllers
# ####################################
app.controller 'UserCtrl', ($scope, $rootScope, User) ->
    $rootScope.users = User.query()

    $scope.addUser = ->
      user = User.save($scope.newUser)
      $rootScope.users.push(user)
      $scope.newUser = {}

    $scope.remove = (user) ->
      if confirm("Sure to delete?")
        user.$remove ->
            $rootScope.users = User.query()

app.controller 'DashboardCtrl', ($scope, $rootScope, Task, Rebalance, Clear) ->
    $scope.balance = ->
      $rootScope.users = Rebalance.query()
      $rootScope.tasks = []

    $scope.clear = ->
      window.location.reload()
      $rootScope.users = Clear.query()
      $rootScope.tasks = Task.query()

app.controller 'TaskCtrl', ($scope, $rootScope, Task) ->
    $rootScope.tasks = Task.query()

    $scope.addTask = ->
      task = Task.save($scope.newTask)
      $rootScope.tasks.push(task)
      $scope.newTask = {}

    $scope.remove = (task) ->
      if confirm("Sure to delete?")
        task.$remove ->
            $rootScope.tasks = Task.query()
