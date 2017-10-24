#! /usr/bin/env ruby
require 'shellwords'

Dir::mkdir('output') unless Dir::exist?('output')

Dir.glob('*.{MOV,m4v,mp4}').each do |unescaped_input_filename|
  input_filename = Shellwords.escape(unescaped_input_filename)
  output_filename = Shellwords.escape(File.basename(unescaped_input_filename, '.*') + '.mp4')

  system "ffmpeg -i #{input_filename} -vf scale=iw/2:ih/2 ./output/#{output_filename}"
end
