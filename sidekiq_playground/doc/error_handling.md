* Side Kiq will auto retry failed job,
* Retry jobs can be config to not retry 

   ```ruby
   class OurWorker
     include Sidekiq::Worker
     sidekiq_options retry: 0
   #.......
   end
   ```
