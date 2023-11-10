# Open the Pull Request URL for your current directory's branch (base branch defaults to main)
function openpr() {
  github_url=$(git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/')
  branch_name=$(git symbolic-ref HEAD | cut -d"/" -f 3,4)
  pr_url=$github_url"/pull/new/"$branch_name
  open $pr_url
}

# Run git push and then immediately open the Pull Request URL
function submit() {
  git push origin HEAD

  if [ $? -eq 0 ]; then
    openpr
  else
    echo 'failed to push commits and open a pull request.'
  fi
}
