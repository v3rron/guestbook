/**
 * Created with JetBrains RubyMine.
 * User: go7hic
 * Date: 8/26/13
 * Time: 14:56
 * To change this template use File | Settings | File Templates.
 */

angular.module('event', ['eventService'])
    .config(['$routeProvider', function($provider) {
        $provider
            .when('/events', {templateUrl: '/events/index.html', controller: EventsCtrl})
            .when('/events/new', {templateUrl: '/events/new.html', controller: EventNewCtrl})
            .when('/events/:event_id', {templateUrl: '/events/show.html', controller: EventCtrl})
            .when('/events/:event_id/edit', {templateUrl: '/events/edit.html', controller: EventEditCtrl});
    }])
    .config(["$httpProvider", function(provider) {
        provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }]);

angular.module('eventService', ['ngResource']).
    factory('Events', function($resource) {
        return $resource('/events.json', {}, {
            index: { method: 'GET', isArray: true},
            create: { method: 'POST' }
        });
    }).
    factory('Event', function($resource) {
        return $resource('/events/:event_id.json', {}, {
            show: { method: 'GET' },
            update: { method: 'PUT' }
        });
    });