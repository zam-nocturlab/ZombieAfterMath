#  Contributing to zam_nocturlab

## Structure of the repository
We'll use the Git method derivated from the `Gitflow'.

The Git flow method results in the creation of a branch for each feature.
Each feature can be the object of multiple pull requests (PRs).

A branch should be called by `<issue_number>-<feature_name>`.

For example:

`1-create-a-simple-neuron`

Push directly to the Master branch is impossible !

## GitHub Projects

GitHub project is a Kanban board connected to GitHub exits! 
For the best progress of the project, please create your tasks in the Backlog or To Do box.

### Using Kanban 
- [x] If you wish to perform a task, click the `Assign Yourself' button.
- [x] To display keyboard shortcuts press the <kbd>?</kbd> key.
- [x] To change the status of a task drag and drop it to an other column.
- [x] To create an issue, create a task and do `Convert to Issue'.
- [x] To make a Merge Request, make sure the branch you are trying to use has the following format:
      `<issue number> - <name of the issue>`
      For example: `1-create-a-simple-neurone`

## Using Git

To start, clone the repository into a folder with your name.

For me: `git clone https://github.com/zam-nocturlab/gamemode.git zam_nocturlab`

Now several cases are possible:
 - You want to retrieve someone else's modifications:
   `git pull`
 - You have conflicts: 
   Conflicts marked with a `C` in the vscode git tab must be resolved.
   You must choose between incomming and current for each file conflict.
   To commit them, save your files and click the "+" on the vscode git tab.
 - You want to send your changes: 
   git status will list the modified files, you can also see them in the vscode git tab.
   `git add <my-file> [<my-other-file> ...]` will prepare your files for upload. You can also do this via the `+` in the vscode git tab.
   `git commit -m "<my message>"` add files to a commit, you can do this via the `` button at the top of the vscode git tab.
   You can add the -S parameter if you have GPG key. It's recommanded to have one.
   `git push` will send all your pending commits to git so that others can get them back, you can do this via the reload button at the bottom left of the blue vscode bar.
 - You want to send your changes to the main git branch:
   On the github.com project page, click `new pull request`,
   Choose the start branch (the one you want to send your changes to) and the end branch (the one you want to send your changes to).
   Put an understandable name, click on `Assign Yourself` on the right,
   At the bottom of the description, note the id of your github issue like this: `Related issues: #1` or `Close #1`.

# Using submodules.

Git Submodules allow to import other repository into the main repository.

We using it to have multiples repository inside the zam-nocturlab organisation and detach plugins developments of the main gamemode repository.
to add a submodule you just have to go inside the `plugins` folder of the gamemode repository and run the command `git submodule add https://github.com/zam-nocturlab/my-new-plugin.git`

That command will create an empty directory called `my-new-plugin` in your current directory and the `.gitmodules` file at the root of the repository.

You have to commit them into the main repository.

To get the content of your plugin repository and start the development you need to run the `git submodule init` and the `git submodule update`.

The last one will pull all remote submodules inside your gamemode project.
