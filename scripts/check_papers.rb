#!/usr/bin/env ruby
# frozen_string_literal: true

readme = File.read(File.expand_path("../README.md", __dir__))
rows = readme.lines.grep(/^\| \d{4}-\d{2} \|/)
minimum = 100

abort "Expected at least #{minimum} papers, found #{rows.length}." if rows.length < minimum

dates = rows.map { |row| row[/^\| (\d{4}-\d{2}) \|/, 1] }
abort "Paper index is not sorted newest first." unless dates == dates.sort.reverse

titles = rows.map { |row| row.split("|")[2].to_s.gsub("**", "").strip.downcase }
counts = titles.each_with_object(Hash.new(0)) { |title, memo| memo[title] += 1 }
duplicates = counts.select { |_title, count| count > 1 }.keys
abort "Duplicate paper titles: #{duplicates.join(', ')}" unless duplicates.empty?

puts "Paper index OK: #{rows.length} unique papers, newest first."
