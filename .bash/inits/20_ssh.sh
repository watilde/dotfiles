if [ -f ~/.ssh-agent ]; then
  . ~/.ssh-agent
fi

if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
  ssh-agent > ~/.ssh-agent
  . ~/.ssh-agent
fi

ssh-add -l >& /dev/null || ssh-add
