# The script below was removed because it is better handled by bash-it's
# 'sshagent' plugin. To enable it, run: bash-it enable plugin sshagent
#
# if [ -f ~/.ssh-agent ]; then
#  . ~/.ssh-agent > /dev/null
# fi
#
# if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
#  ssh-agent > ~/.ssh-agent
#  . ~/.ssh-agent
# fi
#
# ssh-add -l >& /dev/null || ssh-add
