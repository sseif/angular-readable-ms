'use strict'

describe 'Filter: readableMs', ->
  readableMs = null
  oneSecond = 1000
  oneMinute = 60 * 1000
  oneHour = 60 * 60 * 1000
  oneDay = oneHour * 24
  oneWeek = oneDay * 7
  oneMonth = oneWeek * 4
  oneYear = oneWeek * 52

  # Ensure the module is loaded
  beforeEach module 'readableMs'

  beforeEach inject (_$filter_) ->
    readableMs = _$filter_ 'readableMs'

  it 'can handle negative values', ->
    expect(readableMs '119000').toEqual '1m 59s'
    expect(readableMs '-119000').toEqual '- 1m 59s'

  describe 'Seconds', ->

      it 'Formats seconds to one decimal place', ->
        expect(readableMs '1000').toEqual '1.0s'
        expect(readableMs '2400').toEqual '2.4s'
        expect(readableMs '58990').toEqual '59.0s'

  describe 'Minutes', ->

      it 'Formats minutes with no decimal place', ->
        expect(readableMs '60000').toEqual '1m'

      it 'Does not include seconds if the seconds value equals 0', ->
        expect(readableMs '120000').toEqual '2m'
        expect(readableMs '3540000').toEqual '59m'

      it 'Includes seconds (with no decimal) with minutes if there are extra seconds', ->
        expect(readableMs '119000').toEqual '1m 59s'

  describe 'Hours', ->
    fifteenMinutes = oneMinute * 15
    fourSeconds = oneSecond * 4

    it 'Does not include other units if their values equal 0', ->
      expect(readableMs oneHour).toEqual '1h'

    it 'Formats hours and other units correctly', ->
      expect(
        readableMs(oneHour + fifteenMinutes + fourSeconds)
      ).toEqual '1h 15m 4s'

  describe 'Days', ->
    sixHours = oneHour * 6
    tenMinutes = oneMinute * 10

    it 'Does not include other units if their values equal 0', ->
      expect(readableMs oneDay).toEqual '1d'

    it 'Formats days and other units correctly', ->
      expect(
        readableMs(oneDay + sixHours + tenMinutes + oneSecond)
      ).toEqual '1d 6h 10m 1s'

  describe 'Weeks', ->
    threeDays = oneDay * 3
    fourHours = oneHour * 4
    fiftyEightMinutes = oneMinute * 58

    it 'Does not include other units if their values equal 0', ->
      expect(readableMs oneWeek).toEqual '1w'

    it 'Formats weeks and other units correctly', ->
      expect(
        readableMs(oneWeek + threeDays + fourHours + fiftyEightMinutes)
      ).toEqual '1w 3d 4h 58m'

  describe 'Months', ->
    threeWeeks = oneWeek * 3

    xit 'Does not include other units if their values equal 0', ->
      expect(readableMs oneMonth).toEqual '1mth'

    xit 'Formats months and other units correctly', ->
      expect(
        readableMs(oneMonth + threeWeeks + oneDay)
      ).toEqual '1mth 3w 1d'

  describe 'Years', ->
    twoMonths = oneMonth * 2
    twoDays = oneDay * 3
    twoWeeks = oneWeek * 2

    xit 'Does not include other units if their values equal 0', ->
      expect(readableMs oneYear).toEqual '1yr'

    xit 'Formats years and other units correctly', ->
      expect(
        readableMs(oneYear + twoMonths + twoWeeks + twoDays)
      ).toEqual '1y 2mth 2w 2d'
