require "puma"

threads `nproc --all`.to_i,`nproc --all`.to_i
workers `nproc --all`.to_i * 2
port 3000