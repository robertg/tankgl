mod = require "#{process.cwd()}/src/tankgl"

describe 'tankgl', ->
  it 'should exist', ->
    mod.should.be.ok

  describe '#hello', ->
    it 'should return the right value', ->
      mod.hello().should.eql 'hello tankgl'


