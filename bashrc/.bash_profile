source ~/.bashrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

##
# Your previous /Users/jphoenx/.bash_profile file was backed up as /Users/jphoenx/.bash_profile.macports-saved_2018-06-23_at_14:07:34
##

# MacPorts Installer addition on 2018-06-23_at_14:07:34: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$HOME/.cargo/bin:$PATH"
