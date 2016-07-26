var app = angular.module('worldbank', []);

var server = 'immense-plains-19871.herokuapp.com'
// var server = 'localhost:3001'



app.controller('mainController', ['$http', function ($http) {
	// freeze the scope: self now refers to this level of scope
  var self = this;

  var initialize = function () {
    this.formdata = {};

// http/ajax call to get number of records in db
  	$http({ method: 'GET', url: `https://${server}/wb_info/count`})
      .then(function (response) {
  		// set up number of records
  		  self.numberOfRecords = response.data;
      });

    // http/ajax call to get unique regions for click-display
    $http({ method: 'GET', url: `https://${server}/wb_info/unique_regions` })
      .then(function (response) {
      // set up array of unique regions
      self.regionList = response.data;
    });
  };

  initialize();

  // function activated by click event
  // retrieve all records by region
  this.getByRegion = function(region) {
  	$http({
  		method: 'GET',
  		url: `https://${server}/wb_info/by_name/` + region
  	}).then(function(response) {
      console.log(response)
      self.infoList = response.data;
  	});
  };


  this.processForm = function() {
    $http({
      method  : 'POST',
      url     : `https://${server}/wb_info`,
      data    : this.formdata
   }).then(function(data) {
      initialize();
   });
  };
}]);
