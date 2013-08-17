#!/usr/bin/env ruby
# encoding: utf-8

File.open('actions.txt') do |f|
    f.each do |action|
        dir_path = `ls ~/storage/Geneva | grep #{action}`
        full_path = File.join('/', 'home', 'astro', 'phrfbf', 'storage', 'Geneva', dir_path)
        system "python tools/upload_action.py #{full_path}"
    end
end
