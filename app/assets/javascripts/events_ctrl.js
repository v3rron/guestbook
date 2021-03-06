//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
'use strict';

function EventsCtrl ($scope, $http){
    $http.get("/events.json").success(function(data){
        $scope.events = data;
        console.log(data);
    })
}

EventsCtrl.$inject = ['$scope', '$http'];

$('body').on('ajax:success', '.delete-event', function() {
    $(this).parent().parent().fadeOut();
    alert('Event deleted!!!');
});
