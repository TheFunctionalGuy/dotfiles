function assh --wraps='env TERM=xterm-256color ssh' --description 'alias assh=env TERM=xterm-256color ssh'
    env TERM=xterm-256color ssh $argv
end
