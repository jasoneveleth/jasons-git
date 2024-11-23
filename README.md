# jasons-git

## New commands

* [ ] `search-history` -- a subset of `git log`, `git log -S $string $filename` or `git log -G $regex $filename` or trace evolution fo the line range `git log -L<start>,<end>:<file>` or function `git log -L<func>:<file>`
* [ ] `cherry-pick-file` -- alt names: `pluck`, `snipe` `replace-obj` to make a particular file in working tree (or staging area with --staged) resemble another object (or add a new object).
* [ ] `cherry-pick-commit` -- subset of `git cherry-pick`, new commit that emulates what an old commit did
* [ ] `replicate` -- takes a `--staged` flag, make working tree look like this commit (but don't change HEAD and maybe don't change staging area), alt names: `copy-to`
* [ ] `delete` -- stage the deletion of file without affecting working tree, `git rm --cached <file>` or `git reset <file>`
* [ ] `rename-remote` ^^
* [ ] `delete-tag` ^^
* [ ] `root` ^^
* [ ] `undo-commit` ^^ or reset --soft HEAD^
* [ ] `move-tag --from` 
* [ ] `ignore` -- with a --untracked flag to ignore all untracked, or unstaged
* [ ] `reword-commit` by default takes the last
* [ ] `editmsg` -- edit last commit message
* [ ] `amend` -- takes --same-message, and same flags as commit
* [ ] `unstage` -- subset of `git restore --staged`, takes an `--all` flag (`git reset`) -- also include `git rm --cached` for newly added files
* [ ] a command to switch the staging area and working tree?

* [ ] `status` -- should show: unstaged changes, staged changes, untracked files, (tracked files if asked), (ignored files if asked), should tell you if you're branch is behind remote, and advise what to do if you are merging/rebasing/bisecting/etc

* [ ] `create-fake-repo` based on input file with a tree inside (which looks like git log --graph --all)
* [ ] `active-branches` -- branches with stashes on them

## Maybe not

graphviz = "!f() { echo 'digraph git {' ; git log --pretty='format:  %h -> { %p }' \"$@\" | sed 's/[0-9a-f][0-9a-f]*/\"&\"/g' ; echo '}'; }; f"
$ git graphviz HEAD~100..HEAD~60 | dotty /dev/stdin
$ git graphviz --first-parent master | dotty /dev/stdin

## References

https://github.com/tj/git-extras
https://github.com/gitless-vcs/gitless/tree/master/gitless/cli

https://pypi.org/project/legit/0.1.1/
https://github.com/trast/tbdiff
https://github.com/dfabulich/easygit
https://gitless.com/#vs

https://github.com/newren/git/blob/master/personal-docs/merge-handling-workshop

## What do these do?

git diff --check

git ls-files -u

git log --merge --left-right -p

## Goals

TODO: Never lose data. Always create a backup ref (tmp branches, tmp files). https://gist.github.com/chx/85db0ebed1e02ab14b1a65b6024dea29, or git-fugitive and see what happens when you 'discard' with X
I like the idea of printing out how to undo a reset.

