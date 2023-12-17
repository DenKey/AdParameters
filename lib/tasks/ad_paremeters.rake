# frozen_string_literal: true

require './config/loader'

desc 'print eligible creatives'
task :ad_parameters do |_tasks, _args|
  pp AdParameters.new.call.to_hash
end
