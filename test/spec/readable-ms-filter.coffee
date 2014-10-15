'use strict'

describe 'Filter: readableMs', ->
  readableMs = null

  # Ensure the module is loaded
  beforeEach module 'readableMs'

  beforeEach inject (_$filter_) ->
    readableMs = _$filter_ 'readableMs'

  describe 'Seconds', ->

      it 'Formats seconds to one decimal place', ->
        expect(readableMs '1000').toEqual '1.0s'
        expect(readableMs '2400').toEqual '2.4s'
        expect(readableMs '58990').toEqual '59.0s'

  describe 'Minutes', ->

      it 'Formats minutes with no decimal place', ->
        expect(readableMs '60000').toEqual '1m'

      it 'Does not include seconds with minutes if there are 0 extra seconds', ->
        expect(readableMs '120000').toEqual '2m'
        expect(readableMs '3540000').toEqual '59m'

      it 'Includes seconds (with no decimal) with minutes if there are extra seconds', ->
        expect(readableMs '119000').toEqual '1m 59s'


  # TODO: implement hours, weeks, months, and years
  describe 'Hours', ->

    xit 'Formats hours correctly', ->

  describe 'Weeks', ->

    xit 'Formats weeks correctly', ->

  describe 'Months', ->

    xit 'Formats months correctly', ->

  describe 'Years', ->

    xit 'Formats years correctly', ->
