require "rubygems"
require_relative "./rack_commonlogger_patch"
require_relative './app.rb'

#to see the greate RAM consumption, just uncomment the code below
SOME_CONST = []
(1..3_500_000).each do |i|
  SOME_CONST << "foo"
end

run App