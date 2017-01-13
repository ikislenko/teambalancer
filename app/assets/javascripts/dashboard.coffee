app = angular.module('teambalancer', ["ngResource"])

app.controller 'UserCtrl', ($scope, $resource) ->
    User = $resource("/users/:id", {id: "@id"}, {
      update: {method: "PUT"}
      delete: {method: "delete"}
      })
    $scope.users = User.query()

    $scope.addUser = ->
      return if $scope.newUser == undefined
      user = User.save($scope.newUser)
      $scope.users.push(user)
      $scope.newUser = {}
      user = {}

    $scope.remove = (user) ->
      if confirm("Sure to delete?")
        user.$remove ->
            $scope.users = User.query()

app.controller 'TaskCtrl', ($scope, $resource) ->
    Task = $resource("/tasks/:id", {id: "@id"}, {
      update: {method: "PUT"}
      delete: {method: "delete"}
      })
    $scope.tasks = Task.query()

    $scope.addTask = ->
      return if $scope.newTask == undefined
      task = Task.save($scope.newTask)
      $scope.tasks.push(task)
      $scope.newTask = {}
      task = {}

    $scope.remove = (task) ->
      if confirm("Sure to delete?")
        task.$remove ->
            $scope.tasks = Task.query()
