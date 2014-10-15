(function() {
  'use strict';
  angular.module('readableMs', []).filter('readableMs', function() {
    return function(milliseconds) {
      var day, formatDays, formatHours, formatMinutes, formatMonths, formatSeconds, formatWeeks, formatYears, hour, minute, month, seconds, week, year;
      seconds = (parseInt(milliseconds) / 1000).toFixed(1);
      minute = 60;
      hour = minute * 60;
      day = hour * 24;
      week = day * 7;
      year = day * 365;
      month = year / 12;
      formatSeconds = function(seconds, decimals) {
        if (decimals == null) {
          decimals = 0;
        }
        if (decimals = 1) {
          return "" + seconds + "s";
        } else {
          return "" + (Math.round(seconds)) + "s";
        }
      };
      formatMinutes = function(seconds) {
        var baseMinutes, formattedSeconds, minutes, remainingSeconds, result;
        minutes = seconds / minute;
        baseMinutes = Math.floor(minutes);
        remainingSeconds = Math.round((minutes - baseMinutes) * 60);
        formattedSeconds = formatSeconds(remainingSeconds);
        result = "" + baseMinutes + "m";
        if (formattedSeconds !== '0s') {
          result += " " + formattedSeconds;
        }
        return result;
      };
      formatHours = function(seconds) {
        return new Error("Not yet implemented.");
      };
      formatDays = function(seconds) {
        return new Error("Not yet implemented.");
      };
      formatWeeks = function(seconds) {
        return new Error("Not yet implemented.");
      };
      formatMonths = function(seconds) {
        return new Error("Not yet implemented.");
      };
      formatYears = function(seconds) {
        return new Error("Not yet implemented.");
      };
      switch (false) {
        case !(seconds < minute):
          return formatSeconds(seconds, 1);
        case !(seconds < hour):
          return formatMinutes(seconds);
        case !(seconds < day):
          return formatHours(seconds);
        case !(seconds < week):
          return formatDays(seconds);
        case !(seconds < month):
          return formatWeeks(seconds);
        case !(seconds < year):
          return formatMonths(seconds);
        default:
          return formatYears(seconds);
      }
    };
  });

}).call(this);

/*
//@ sourceMappingURL=angular-readable-ms.js.map
*/