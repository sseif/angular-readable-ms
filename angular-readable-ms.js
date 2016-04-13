(function() {
  'use strict';
  angular.module('readableMs', []).filter('readableMs', function() {
    return function(milliseconds) {
      var DAY_IN_SECONDS, HOUR_IN_SECONDS, MINUTE_IN_SECONDS, MONTH_IN_SECONDS, WEEK_IN_SECONDS, YEAR_IN_SECONDS, display, formatDays, formatHours, formatMinutes, formatMonths, formatSeconds, formatWeeks, formatYears, negative, seconds, timeUnits;
      negative = parseInt(milliseconds) < 0;
      seconds = parseInt(milliseconds) / 1000;
      seconds = Math.abs(seconds);
      MINUTE_IN_SECONDS = 60;
      HOUR_IN_SECONDS = MINUTE_IN_SECONDS * 60;
      DAY_IN_SECONDS = HOUR_IN_SECONDS * 24;
      WEEK_IN_SECONDS = DAY_IN_SECONDS * 7;
      YEAR_IN_SECONDS = DAY_IN_SECONDS * 365;
      MONTH_IN_SECONDS = YEAR_IN_SECONDS / 12;
      timeUnits = {
        years: null,
        months: null,
        weeks: null,
        days: null,
        hours: null,
        minutes: null,
        seconds: null
      };
      display = function() {
        return ("        " + (negative ? '-' : '') + "        " + (timeUnits.years ? ' ' + timeUnits.years + 'yr' : '') + "        " + (timeUnits.months ? ' ' + timeUnits.months + 'mth' : '') + "        " + (timeUnits.weeks ? ' ' + timeUnits.weeks + 'w' : '') + "        " + (timeUnits.days ? ' ' + timeUnits.days + 'd' : '') + "        " + (timeUnits.hours ? ' ' + timeUnits.hours + 'h' : '') + "        " + (timeUnits.minutes ? ' ' + timeUnits.minutes + 'm' : '') + "        " + (timeUnits.seconds ? ' ' + timeUnits.seconds + 's' : '') + "        ").trim();
      };
      formatSeconds = function(seconds, decimals) {
        if (decimals == null) {
          decimals = 0;
        }
        if (decimals === 1) {
          timeUnits.seconds = seconds.toFixed(1);
        } else {
          timeUnits.seconds = Math.round(seconds);
        }
        return display();
      };
      formatMinutes = function(seconds) {
        var remainingSeconds;
        timeUnits.minutes = Math.floor(seconds / MINUTE_IN_SECONDS);
        remainingSeconds = seconds - (timeUnits.minutes * MINUTE_IN_SECONDS);
        return formatSeconds(remainingSeconds);
      };
      formatHours = function(seconds) {
        var remainingSeconds;
        timeUnits.hours = Math.floor(seconds / HOUR_IN_SECONDS);
        remainingSeconds = seconds - (timeUnits.hours * HOUR_IN_SECONDS);
        return formatMinutes(remainingSeconds);
      };
      formatDays = function(seconds) {
        var remainingSeconds;
        timeUnits.days = Math.floor(seconds / DAY_IN_SECONDS);
        remainingSeconds = seconds - (timeUnits.days * DAY_IN_SECONDS);
        return formatHours(remainingSeconds);
      };
      formatWeeks = function(seconds) {
        var remainingSeconds;
        timeUnits.weeks = Math.floor(seconds / WEEK_IN_SECONDS);
        remainingSeconds = seconds - (timeUnits.weeks * WEEK_IN_SECONDS);
        return formatDays(remainingSeconds);
      };
      formatMonths = function(seconds) {
        var remainingSeconds;
        timeUnits.months = Math.floor(seconds / MONTH_IN_SECONDS);
        remainingSeconds = seconds - (timeUnits.months * MONTH_IN_SECONDS);
        return formatWeeks(remainingSeconds);
      };
      formatYears = function(seconds) {
        var remainingSeconds;
        timeUnits.years = Math.floor(seconds / YEAR_IN_SECONDS);
        remainingSeconds = seconds - (timeUnits.years * YEAR_IN_SECONDS);
        return formatMonths(remainingSeconds);
      };
      switch (false) {
        case !(seconds < MINUTE_IN_SECONDS):
          return formatSeconds(seconds, 1);
        case !(seconds < HOUR_IN_SECONDS):
          return formatMinutes(seconds);
        case !(seconds < DAY_IN_SECONDS):
          return formatHours(seconds);
        case !(seconds < WEEK_IN_SECONDS):
          return formatDays(seconds);
        case !(seconds < MONTH_IN_SECONDS):
          return formatWeeks(seconds);
        case !(seconds < YEAR_IN_SECONDS):
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