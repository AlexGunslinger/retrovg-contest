controllers = angular.module('controllers')

controllers.controller("ScoreboardController", [ '$scope', '$routeParams', '$location', '$http',
  ($scope, $routeParams, $location, $http)->
    $http.get('/scoreboard.json').success((data) ->
      $scope.players     = data.players
      $scope.submissions = data.submissions
    )

    $scope.displayMain = () ->
      $scope.title   = "Main Scoreboard"
      $scope.notMain = false
      $scope.template_scoreboard  = "main_scoreboard.html"
      $scope.template_submissions = "main_submissions.html"

    $scope.displayPlayer = (player_id) ->
      $http.get('/player_scoreboard/'+player_id+'.json').success((data) ->
        $scope.title   = data.player_name+"'s Best Scores"
        $scope.notMain = true
        $scope.games   = data.games
        $scope.player_submissions   = data.submissions
        $scope.template_scoreboard  = "player_scoreboard.html"
        $scope.template_submissions = "player_submissions.html"
      )

    $scope.displayMain() 

])