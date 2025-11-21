preferred_locale="en_US.UTF-8"
fallback_locale="C.UTF-8"
target_locale=""
kernel_name=$(uname -s 2>/dev/null)

case "$kernel_name" in
  Darwin*|MINGW*|MSYS*|CYGWIN*)
    target_locale="$preferred_locale"
    ;;
  *)
    if [ -d /usr/lib/locale/en_US.utf8 ]; then
      target_locale="$preferred_locale"
    elif [ -d /usr/lib/locale/C.utf8 ]; then
      target_locale="$fallback_locale"
    fi
    ;;
esac

if [ -n "$target_locale" ]; then
  export LANG="$target_locale"
  export LC_ALL="$target_locale"
fi
