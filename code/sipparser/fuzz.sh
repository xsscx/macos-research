for binary in `find . -perm -0100 -type f ! -path "*/dSYM/*"`; do
  if file $binary | grep -q 'Mach-O'; then
    for arg in poc{1..20}; do
      $binary $arg
    done
  fi
done
