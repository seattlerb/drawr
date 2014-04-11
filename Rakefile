# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/drawr.rb'

Hoe.new('drawr', Drawr::VERSION) do |p|
  p.author          = 'Aaron Patterson'
  p.email           = 'aaronp@rubyforge.org'
  p.summary         = p.paragraphs_of('README.txt', 2).join("\n\n")
  p.description     = p.paragraphs_of('README.txt', 1..7).join("\n\n")
  p.url = p.paragraphs_of('README.txt', 0).first.split(/\n/).last.strip
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
end

# vim: syntax=Ruby
