# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
#
#絶対パスからの相対パスの指定
env :PATH, ENV['PATH']
#ログファイルの出力先
set :output, 'log/cron.log'
#ジョブの実行環境の設定
# set :enviroment, :development
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 1.days, at: '11:19 am' do

#Rails内のメソッド実行
runner 'Appliance.compare_warranty_period'
end

# Learn more: http://github.com/javan/whenever
