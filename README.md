in order to start unicorn do the following

`gem install unicorn` and run
`unicorn --config-file unicorn.rb` #unicorn.rb contains the number of worker processes and port

in order to start puma do the following

`gem install puma` and run
`puma -C puma.rb` #puma.rb contains the number of worker processes, threads per worker number and port

in order to queue API simultaneosuly I used `ab` that comes from apache
ab -n 10 -c 3 "http://localhost:3000/slow" will call `slow` API 10 times with 3 concurrent requests at a time

server log are adjusted. If you want to change them go to `rack_commonlogger_patch.rb`