function _install {
  if [[ $# -ne 1 ]]; then
    echo "Must specify operating system."
    echo "e.g. linux | mac"
    return 1
  fi
  local os=$1
  declare -A configs
  configs=(
      ['.gitconfig']="$SYSTEM_ROOT/universal/dotfiles/git/gitconfig"
      ['.bashrc']="$SYSTEM_ROOT/$os/dotfiles/bash/bashrc"
      ['.tmux.conf']="$SYSTEM_ROOT/universal/dotfiles/tmux/tmuxrc"
      ['.tmate.conf']="$SYSTEM_ROOT/universal/dotfiles/tmux/tmuxrc"
  )

  for target in "${!configs[@]}"
  do
    rm ~/$target 2> /dev/null || true
    ln -s ${configs[$target]} ~/$target
  done
}
