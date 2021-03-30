# Git snippets

## Create a new repo

```bash
git init
```

## Clone new repo

```bash
git clone /path/to/repository
## OR:
git clone username@host:/path/to/repository
```

## Add & commit local files to remote repo

Add changes to staging area

```bash
git add file.c
```

If you want to add all files in one rush, run:

```bash
git add .
```

:warning: This adds all (!) files to the staging area without any check. Make shure that there are no sensible files uploaded mistakenly!

Then, if you added the file(s), run

```bash
git commit -m "Commit-Message"
```

to put the files to the git HEAD. To finally push the files to the remote repo, run:

```bash
git push origin branch_name
```

## Connect your (new) local repo with existing online-repo

```bash
git init
git remote add origin <server>
```

## Discharge local changes and pull and overwrite things from git

```bash
git checkout filename.xyz
git pull
```

## Discharge local branch and reset to remote head

```bash
git fetch origin
git reset --hard origin/master
```

## Switch off gpg signing

```bash
git config --global commit.gpgsign false
```

## Change Username and E-Mail

```bash
git config user.name "new_username"
git config user.email "new@mail.org"
```

## Add new branch

```bash
git checkout -b name_of_new_branch
git push origin name_of_new_branch
```

## Clone a specific branch only

```bash
git clone --single-branch --branch BRANCHNAME REPO_URL
```

## New tag

1. Add, commit and push new stuff
2. If you want to replace an existing tag, delete the local tag:

    ```bash
    git tag -d v0.0.6
    ```

3. Push deleted tag:

    ```bash
    git push -d origin v0.0.6
    ```

4. New local tag:

    ```bash
    git tag -a v0.0.6 -m "release v0.0.6"
    ```

5. Push local tag

    ```bash
    git push origin v0.0.6
    ```

6. Merge the new date/state to all necessary branches

    ```bash
    ## Merge the status of the development branch into the master:
    git checkout master
    git merge development
    git push

    ## Merge the (new) status of the master branch also into the latest branch:
    git checkout latest
    git merge master
    git push origin latest
    ```

## Archive a branch

```bash
git tag archive/BRANCHNAME BRANCHNAME
git branch -d BRANCHNAME
git checkout master
```

## Get current repo url

```bash
git remote get-url --all origin
```

## New repo-url to existing local repo

```bash
git remote set-url origin https://git.company.com/path/to/your-project.git
```

## Sync local tags with remote (this overwrites local tags)

```bash
git tag
git fetch --prune-tags -f
git tag
```

## Solve `push declined due to email privacy restrictions` error

To get your anonymous E-Mail address, read this answer on Stackoverflow: <https://stackoverflow.com/a/44099011/13890903>

```bash
git config user.email {ID}+{username}@users.noreply.github.com
git commit --amend --reset-author
git push
```
