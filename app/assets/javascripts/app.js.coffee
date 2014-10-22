scoreboard = angular.module('scoreboard',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'ngAnimate',
])

scoreboard.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "main.html"
        controller: 'ScoreboardController'
      )
      .when('/scoreboard/:playerId',
        templateUrl: "main.html"
        controller: "ScoreboardController"
      )
])


controllers = angular.module('controllers',[])