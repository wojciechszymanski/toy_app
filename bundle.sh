function bundle()
{
  case "$1" in
    (install|"")
      shift || true
      gem install --file "$@" ||
        return $?
      ;;
    (exec)
      shift
      env RUBYGEMS_GEMDEPS=- "$@" ||
        return $?
      ;;
    (*)
      echo "
Usage: 
  bundle [install]
  bundle exec <command> [params...]
" > &2
      return 1
      ;;
  esac
}