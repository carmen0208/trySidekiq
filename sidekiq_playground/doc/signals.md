Signals are a POSIX mechianism for inter-process communication.

## Signals for Sidekiq

* TTIN

   * TTIN : Send a TTIN signal to it and it will spit out every worker thread's backtrace, useful for debug

   * Most of these are going to just show they're in **select**, which means they're waiting for work and there are no problems

   ```sh
   ps ax|grep sidekiq # find the server
   kill -TTIN <server_pid> # send it a `TTIN` signal
   ```

* USR1

   * You can also signal the server to stop accepting new jobs to work.(his is useful if you're about to terminate the server and you'd like it to be done working when you terminate it)

   ```sh
   ps ax|grep sidekiq # find the server
   kill -USR1 <server_pid>
   ```

* USR2
  * If you send a USR2 signal, the server will reopen any logfiles that have been rotated using logrotate or something similar.

* TERM

  * When you send the server a TERM signal, Sidekiq will stop processing new jobs and terminate after a set amount of time, which is configured with the -t flag at startup

  ```sh
  ps ax|grep sidekiq # find the server
  kill -TERM <server_pid>
  ```

### How to find PID

   * Option 1 :

    ```sh
    ps aux|grep sidekiq
    ```
   * option 2:

   ```sh
   exec sidekiq -r ./worker.rb -P ~/tmp/sidekiq.pid
   cat -/tmp/sidekid.pid
   ```

### sidekiqctl

   ```sh
   sidekiqctl --help
   sidekiqctl stop ~/tmp/sidekiq.pid
   ```
