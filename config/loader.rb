# frozen_string_literal: true

Bundler.require
require 'zeitwerk'
require 'json'
require 'rake'

module FYBER
end

loader = Zeitwerk::Loader.new
loader.push_dir('models')
loader.push_dir('services')
loader.push_dir('definitions/fyber', namespace: FYBER)
loader.enable_reloading
loader.setup
