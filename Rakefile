# frozen_string_literal: true

ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require "bundler/gem_tasks"
require "rubocop/rake_task"


#RuboCop::RakeTask.new

task default: :rubocop
