require "unicorn"

worker_processes `nproc --all`.to_i + 2
listen 3000