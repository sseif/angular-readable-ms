'use strict'

angular.module('readableMs', [])
  .filter 'readableMs', ->

    (milliseconds) ->
      negative = parseInt(milliseconds) < 0
      seconds = (parseInt(milliseconds) / 1000)
      seconds = Math.abs(seconds)

      MINUTE_IN_SECONDS = 60
      HOUR_IN_SECONDS = MINUTE_IN_SECONDS * 60
      DAY_IN_SECONDS = HOUR_IN_SECONDS * 24
      WEEK_IN_SECONDS = DAY_IN_SECONDS * 7
      YEAR_IN_SECONDS = DAY_IN_SECONDS * 365
      MONTH_IN_SECONDS = YEAR_IN_SECONDS / 12

      # Stores a distribution of timeUnits
      timeUnits =
        years: null
        months: null
        weeks: null
        days: null
        hours: null
        minutes: null
        seconds: null

      # Display the time
      display = () ->
        "
        #{if negative then '-' else ''}\
        #{if timeUnits.years then ' ' + timeUnits.years + 'yr' else ''}\
        #{if timeUnits.months then ' ' + timeUnits.months + 'mth' else ''}\
        #{if timeUnits.weeks then ' ' + timeUnits.weeks + 'w' else ''}\
        #{if timeUnits.days then ' ' + timeUnits.days + 'd' else ''}\
        #{if timeUnits.hours then ' ' + timeUnits.hours + 'h' else ''}\
        #{if timeUnits.minutes then ' ' + timeUnits.minutes + 'm' else ''}\
        #{if timeUnits.seconds then ' ' + timeUnits.seconds + 's' else ''}\
        ".trim()

      formatSeconds = (seconds, decimals = 0) ->
        if decimals == 1
          timeUnits.seconds = seconds.toFixed(1)
        else
          timeUnits.seconds = Math.round(seconds)
        display()

      formatMinutes = (seconds) ->
        timeUnits.minutes = Math.floor(seconds / MINUTE_IN_SECONDS)
        remainingSeconds = seconds - (timeUnits.minutes * MINUTE_IN_SECONDS)
        formatSeconds(remainingSeconds)

      formatHours = (seconds) ->
        timeUnits.hours = Math.floor(seconds / HOUR_IN_SECONDS)
        remainingSeconds = seconds - (timeUnits.hours * HOUR_IN_SECONDS)
        formatMinutes(remainingSeconds)

      formatDays = (seconds) ->
        timeUnits.days = Math.floor(seconds / DAY_IN_SECONDS)
        remainingSeconds = seconds - (timeUnits.days * DAY_IN_SECONDS)
        formatHours(remainingSeconds)

      formatWeeks = (seconds) ->
        timeUnits.weeks = Math.floor(seconds / WEEK_IN_SECONDS)
        remainingSeconds = seconds - (timeUnits.weeks * WEEK_IN_SECONDS)
        formatDays(remainingSeconds)

      formatMonths = (seconds) ->
        timeUnits.months = Math.floor(seconds / month)
        remainingSeconds = seconds - (timeUnits.months * month)
        formatWeeks(remainingSeconds)

      formatYears = (seconds) ->
        timeUnits.years = Math.floor(seconds / MONTH_IN_SECONDS)
        remainingSeconds = seconds - (timeUnits.years * MONTH_IN_SECONDS)
        formatMonths(remainingSeconds)

      switch
        when seconds < MINUTE_IN_SECONDS then formatSeconds(seconds, 1)
        when seconds < HOUR_IN_SECONDS then formatMinutes(seconds)
        when seconds < DAY_IN_SECONDS then formatHours(seconds)
        when seconds < WEEK_IN_SECONDS then formatDays(seconds)
        when seconds < MONTH_IN_SECONDS then formatWeeks(seconds)
        when seconds < YEAR_IN_SECONDS then formatMonths(seconds)
        else formatYears(seconds)
