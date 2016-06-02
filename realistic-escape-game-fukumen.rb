#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'set'

def solve
  words = Hash.new
  %w[A B D E H R S T].each { |w| words[w] = 0 }
  puts "DEBT + STAR = DEATH"
  %w[0 1 2 3 4 5 6 7 8 9].map(&:to_i).permutation(8).each do |a, b, d, e, h, r, s, t|
    next if ( d != 1 || d == 0 || s == 0 )

    x = d * 1000 + e * 100 + b * 10 + t
    y = s * 1000 + t * 100 + a * 10 + r
    z = d * 10000 + e * 1000 + a * 100 + t * 10 + h
    if ( z == x + y ) then
      %w[A B D E H R S T].each { |w| words[w] = eval("#{w.downcase}") }
      puts "#{x.to_s} + #{y.to_s} = #{z.to_s}"

      puts "THESEED + DBTHREE = ?"

      x = t * 1000000 + h * 100000 + e * 10000 + s * 1000 + e * 100 + e * 100 + d
      y = d * 1000000 + b * 100000 + t * 10000 + h * 1000 + r * 100 + e * 100 + e

      answer = String.new
      (x + y).to_s.chars.each do |c|
        answer << words.invert[c.to_i].to_s
      end

      puts "#{x.to_s} + #{y.to_s} = #{(x + y).to_s} => #{answer}"
    end
  end
end

solve