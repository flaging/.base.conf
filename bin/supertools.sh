function killer(){
  if [[ $# != 2 ]] || [[ $1 == '-h' ]] || [[ $1 == '--help' ]];then
  echo "Usage: killer [PATTERN]"
  return
  fi
  echo "Process killer starts working..."
  ps -ef | grep $1 | grep -v grep
  echo 'Would you like to killing all of them ? y/n[n]'
  read killing_them
  if [[ $killing_them == 'y' ]];then
    ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill 
  fi

}