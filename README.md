# jasons-git

## New commands

* [x] `stage` -- subset of `git add`
* [ ] `search-history` -- a subset of `git log`, `git log -S $string $filename` or `git log -G $regex $filename` or trace evolution fo the line range `git log -L<start>,<end>:<file>` or function `git log -L<func>:<file>`
* [ ] `cherry-pick-file` -- alt names: `pluck`, `snipe` `replace-obj` to make a particular file in working tree (or staging area with --staged) resemble another object (or add a new object).
* [ ] `cherry-pick-commit` -- subset of `git cherry-pick`, new commit that emulates what an old commit did
* [ ] `view-history` -- a subset of `git log`
* [ ] `replicate` -- takes a `--staged` flag, make working tree look like this commit (but don't change HEAD and maybe don't change staging area), alt names: `copy-to`
* [ ] `point-branch` -- (which does `git branch -f`/`git update-ref`/`git reset <commitish>`) -- won't change staging area or working tree. other names: `replace-ref` `redirect-branch` 
* [ ] `delete` -- stage the deletion of file without affecting working tree, `git rm --cached <file>` or `git reset <file>`
* [ ] `fast-forward` `git merge --ff-only`
* [ ] `abort` -- just like [this](https://github.com/tj/git-extras/blob/master/bin/git-abort)
* [ ] `create-branch` -- exactly what it sounds like
* [ ] `delete-branch` -- exactly like https://github.com/tj/git-extras/blob/master/bin/
* [ ] `rename-branch` ^^
* [ ] `rename-remote` ^^
* [ ] `delete-tag` ^^
* [ ] `root` ^^
* [ ] `alias` to edit the main disbatch file
* [ ] `undo-commit` ^^ or reset --soft HEAD^
* [ ] `track`
* [ ] `untrack`
* [ ] `checkout` -- maybe output whether remote branch is up-to-date
* [ ] `ignore` -- with a --untracked flag to ignore all untracked, or unstaged
* [ ] `editmsg` -- edit last commit message
* [ ] `amend` -- has --same-message, and same flags as commit
* [ ] `unstage` -- subset of `git restore --staged`, takes an `--all` flag (`git reset`) -- also include `git rm --cached` for newly added files
* [ ] a command to switch the staging area and working tree?

## From git

* [x] `commit` -- much more like `git commit`, only commits staged changes, also creates a temporary branch if its in detached state
* [ ] `grep` -- subset of `git grep` https://stackoverflow.com/questions/2928584/how-to-grep-search-committed-code-in-the-git-history
* [ ] `clean` like git clean
* [ ] `revert` -- subset of `git revert`, undoes an old commit
* [ ] `tag` -- identical to `git tag`
* [ ] `merge` -- `git merge --no-ff` by default
* [ ] `diff` -- auto `git diff HEAD` unless args provided, it assumes working tree, so `--staged` will diff working tree with staging area, and `--staged HEAD` will diff staged with commit, `git diff <file1> <file2>`, or `git diff <file1> <commit>` implies `git diff <file1> <commit>:<file1>` -- have a table to my diff vs git's diff
* [ ] `pull` -- subset of `git pull`
* [ ] `bisect` -- subset of `bisect`
* [ ] `remote` -- subset of `remote`
* [ ] `rebase` -- subset of `rebase`
* [ ] `status` -- should show: unstaged changes, staged changes, untracked files, (tracked files if asked), (ignored files if asked), should tell you if you're branch is behind remote, and advise what to do if you are merging/rebasing/bisecting/etc

## Less important

* [ ] `create-fake-repo` based on input file with a tree inside (which looks like git log --graph --all)
* [ ] `active-branches` -- branches with stashes on them

## Maybe not

graphviz = "!f() { echo 'digraph git {' ; git log --pretty='format:  %h -> { %p }' \"$@\" | sed 's/[0-9a-f][0-9a-f]*/\"&\"/g' ; echo '}'; }; f"
$ git graphviz HEAD~100..HEAD~60 | dotty /dev/stdin
$ git graphviz --first-parent master | dotty /dev/stdin

## References

https://github.com/tj/git-extras
https://github.com/gitless-vcs/gitless/tree/master/gitless/cli

## Goals

TODO: Never lose data. Always create a backup ref (tmp branches, tmp files). https://gist.github.com/chx/85db0ebed1e02ab14b1a65b6024dea29, or git-fugitive and see what happens when you 'discard' with X
I like the idea of printing out how to undo a reset.

TODO: -n flag for every command which describes the action at 2 levels of abstraction: what happens in .git dir, and description of what happens at high level

If a subcommand has the same name as a git subcommand, then the git command will act the same as it does. The `jg` version may be missing flags and arguments, but if you replace `jg` with `git` in a well formed command, both have the same behavior. Complete list of exceptions to this rule are highlighted below:

| `jg` command | `git` command |
| --- | --- |
| `jg diff` | `git diff HEAD` |
| `jg merge` | `git merge --no-ff` |
| `jg commit --tracked` | `git commit -a` |
| `jg commit --staged` | `git commit` |
| `jg commit --working` | `git add -A; git commit` |

