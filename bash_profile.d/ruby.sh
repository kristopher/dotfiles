# Inspiration from http://github.com/hashrocket/dotmatrix/blob/master/.hashrc

rails_root() {
  (
    dir=${1:-$(pwd)}
    i=0
    while [ "/" != "$dir" -a "$i" -ne 16 ]; do
      if [ -f "$dir/config/environment.rb" ]; then
        echo "$dir"
        return 0
      fi
      dir="$(dirname "$dir")"
      i=$(expr $i + 1)
    done
    echo "* Does not appear to be a Rails project" >&2
    return 1
  )
}


script_rails() {
  rails_root=`rails_root`
  if [ -f "$rails_root/bin/rails" ]; then
    "$rails_root/bin/rails" "$@"
  elif [ -f "$rails_root/script/rails" ]; then
    "$rails_root/script/rails" "$@"
  elif [ -f "$rails_root/script/$1" ]; then
    local name
    name="$1"
    shift
    "$rails_root/script/$name" "$@"
  else
    return 1
  fi
}

alias sc='script_rails console'
alias sg='script_rails generate'
alias sd='script_rails destroy'
alias ss='script_rails server'
alias sr='script_rails runner'
alias sdbc='script_rails dbconsole -p'

alias r='rake'
alias rs='rake spec'
alias cwip='cucumber --tags @wip'

alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias bo='bundle outdated'


# decent Ruby options for faster local development
export RUBY_GC_HEAP_INIT_SLOTS=11000
export RUBY_GC_HEAP_FREE_SLOTS=5500
export RUBY_GC_HEAP_GROWTH_FACTOR=1.4
export RUBY_GC_HEAP_GROWTH_MAX_SLOTS=0
export RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR=0.9
export RUBY_GC_MALLOC_LIMIT=8192000
export RUBY_GC_MALLOC_LIMIT_MAX=16777216
export RUBY_GC_MALLOC_LIMIT_GROWTH_FACTOR=1.4
export RUBY_GC_OLDMALLOC_LIMIT=8192000
export RUBY_GC_OLDMALLOC_LIMIT_MAX=65563000
export RUBY_GC_OLDMALLOC_LIMIT_GROWTH_FACTOR=0.9
