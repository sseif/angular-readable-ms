'use strict'

angular.module('readableMs', [])
  .filter 'readableMs', ->
    (milliseconds) ->
      seconds = (parseInt(milliseconds) / 1000).toFixed(1)

      minute = 60
      hour = minute * 60
      day = hour * 24
      week = day * 7
      year = day * 365
      month = year / 12

      formatSeconds = (seconds, decimals = 0) ->
        if decimals = 1
          "#{seconds}s"
        else
          "#{Math.round(seconds)}s"

      formatMinutes = (seconds) ->
        minutes = seconds / minute
        baseMinutes = Math.floor(minutes)
        remainingSeconds = Math.round((minutes - baseMinutes) * 60)
        formattedSeconds = formatSeconds(remainingSeconds)

        result = "#{baseMinutes}m"
        result += " #{formattedSeconds}" unless formattedSeconds == '0s'
        result

      formatHours = (seconds) ->
        new Error "Not yet implemented."

      formatDays = (seconds) ->
        new Error "Not yet implemented."

      formatWeeks = (seconds) ->
        new Error "Not yet implemented."

      formatMonths = (seconds) ->
        new Error "Not yet implemented."

      formatYears = (seconds) ->
        new Error "Not yet implemented."

      switch
        when seconds < minute then formatSeconds(seconds, 1)
        when seconds < hour then formatMinutes(seconds)
        when seconds < day then formatHours(seconds)
        when seconds < week then formatDays(seconds)
        when seconds < month then formatWeeks(seconds)
        when seconds < year then formatMonths(seconds)
        else formatYears(seconds)
