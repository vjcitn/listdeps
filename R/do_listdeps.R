#' list dependents of a given package
#' @import git2r
#' @param pname character(1) name of package
#' @note This will push a revised version of this package to trigger the action.
#' @export
do_listdependents = function(pname="ROC", user, pass) {
  git2r::clone("https://github.com/vjcitn/listdeps", "listdeps", branch="master")
  setwd("listdeps")
  cc = git2r::cred_user_pass(user, pass)
  wf = readLines(".github/workflows/main.yml")
  wf = gsub("%%P2G%%", pname, wf)
  writeLines(wf, ".github/workflows/main.yml")
  git2r::push(credentials=cc)
}
  
 
