# Sidekiq Playground

Sample ruby project running sidekiq.  Requires a bit of setup:

1. Setting up the web UI - Sidekiq's web UI requires a valid CSRF token.  open up a ruby console and run the following:

```
require 'securerandom'
File.open(".session.key", "w") {|f| f.write(SecureRandom.hex(32)) }
```

2. Load up the web UI

```
rackup
```

3. Ensure you have redis running on your machine and then start sidekiq on a side process:

```
redis-cli ping
> PONG (If it's running)
bundle exec sidekiq -r ./worker.rb
```

4. You can either boot up a ruby console and manually spin off jobs:

```
irb -r ./worker.rb

> Worker.perform_async("super_hard")
```

5. Or you can spin off jobs every so often by running the scheduler:

```
ruby scheduler.rb
```