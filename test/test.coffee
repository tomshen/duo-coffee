assert = require 'assert'
fs = require 'fs'
path = require 'path'

Duo = require 'duo'

coffee = require '../index.js'

describe 'duo-coffee', ->
  it 'should transpile CoffeeScript to JavaScript', (done) ->
    duo = new Duo(__dirname)
      .entry 'input.coffee'
      .use coffee(header: false)

    duo.run (err, duoOutput) ->
      assert.ifError err
      fs.readFile path.join(__dirname, 'output.js'), 'utf8', (err, correctOutput) ->
        assert.ifError err
        assert duoOutput.indexOf(correctOutput) != -1
        done()
