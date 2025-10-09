# 🧠 Git Demo — Overview and Instructions  

*Last updated:  8.10.2025 DDMMYYYY*  

Welcome to the **Git Demo** repository!  <br>  
This walkthrough will guide you through Git workflow examples — from setting up RStudio to creating, reviewing, and merging pull requests.   
 <br>
As we have the instructions here, dedicate one tab in your browser to follow this README.
 <br>  
Everyone can progress at their own pace, reading the instructions and executing the steps as they go along - until otherwise mentioned in the instruction steps. 

> ⚠️ **Note:** There is no need to run any of the R code in this repository until instructed, it's just version control simulation.  
Also, do not use `git fetch, git pull` or similar commands without being instructed. <br>  `<>` symbols are placeholders for you to replace with your own info.

---

## 📚 Table of Contents  
- [🧭 Demo content](#demo-contents)  
- [⚙️ Setting Up Git in RStudio](#️setting-up-git-in-rstudio)  
   - [🔧 Configuring Git Executable Path](#configuring-git-executable-path)  
   - [👤 Setting Up Git Credentials](#setting-up-git-credentials)  
- [🌿 Understanding Branches](#understanding-branches)  
- [📥 Cloning a Repository](#cloning-a-repository)  
- [🤝 Contributing to a Repository (Non-Conflicting Changes)](#contributing-to-a-repository-non-conflicting-changes)  
- [⚔️ Editing a Repository (Conflicting Changes)](#️editing-a-repository-conflicting-changes)  
- [🏁 Summary](#summary)  
- [📑 Basic Git Commands And Explanations](#basic-git-commands-and-explanations)  
---

## 🧭 Demo contents  <a id="demo-contents"></a>

This demo teaches you:  
- How to set up Git inside RStudio  
- How to clone repositories  
- How to create branches, make commits, and push changes  
- How to create pull requests and review other people’s code  
- How to deal with merge conflicts safely and responsibly  

At the end, we can have a look at how to create your own repositories, set up basic protections rules, and a README.md example that we have for DQC.

---

## ⚙️ Setting Up Git in RStudio  <a id="️setting-up-git-in-rstudio"></a>

### 🔧 Configuring Git Executable Path  <a id="configuring-git-executable-path"></a>

In RStudio, you must tell the application where Git lives.  
If you didn’t receive Gits location in the filesystem during installation but **Git Bash** is installed, paste this in there:

```
cygpath -w $(which git)
```
Copy the resulting path, then navigate to:    
`RStudio → Tools → Global Options → Git/SVN`  
and paste the path into the **Git executable** field.

---

### 👤 Setting Up Git Credentials   
<a id="setting-up-git-credentials"></a>

Why?  
To let others know *who made each change* — your **commit authorship** is defined by your local `user.name` and `user.email` that are set on your computer.

Set them globally for all repos by writing into the **Terminal** (not Console) tab in RStudio:

```
git config --global user.name <"Firstname Lastname">
git config --global user.email <"your_email@example.com">
```

Verify by writing the following:

```
git config --global user.name
git config --global user.email
```

Your Github (not Git) authentication credentials on the other hand are stored securely on your machine after signing in once (usually in **Windows Credential Manager → Windows Credentials**).

---

## 🌿 Understanding Branches and Git file system  <a id="understanding-branches"></a>

> ✍️ *Main* is often the production branch — protected so no unreviewed changes enter.  

Collaborators can create their own branches (e.g., `dev_<your_name>`) for independent work.  
Multiple people can contribute to different branches simultaneously, later merging approved changes back to main.  
Working on the same development branches as others is also possible.

When you create a new file in your working directory, Git doesn’t yet associate it with any specific branch — it’s just an untracked file sitting on your computer.  
Only when you commit the file does Git record it in the history of the current branch. That’s the moment you’re telling Git, “add this file to the timeline of this branch.”  
Until then, if you switch branches, the file will still be there in your working directory (since Git hasn’t started tracking it yet), so it might look like it belongs everywhere — but technically, it belongs nowhere until committed.

---

## 📥 Cloning a Repository  <a id="cloning-a-repository"></a>


1. Go to the GitHub repository in your browser.  
2. Click the green **“<> Code”** button and copy the HTTPS link.  
3. In RStudio:  
   - **File → New Project → Version Control → Git**  
   - Paste the URL and choose where to save the workspace.  

This creates a local copy of the repository on your machine.

Cloning a public repository can be done without authentication, but pushing changes will require it.  
A private repository will always require authentication.

---

## 🤝 Contributing to a Repository (Non-Conflicting Changes)  <a id="contributing-to-a-repository-non-conflicting-changes"></a>

The `main` branch is protected in this repository — think of it as the production version.  
Now as we have cloned the repository, let’s create a development branch and see if we can contribute to main branch using it.

### 🪄 Step 1 — Create Your Branch and Commit  

1. Open the **Git** tab in RStudio.  
2. Click **New Branch** → name it `dev_<your_name>`.  This will prompt you to authenticate yourself if you haven't yet, choose browser.
3. Verify your active branch by writing the following in the **Terminal** tab (not the Console):

```
git branch
```

4. Create a new file named `<YourName>.R`.  
5. Copy contents from `GIT-DEMO-TEMPLATE.R` into the file and change only the `"Name"` field to your preferred username, let's wait a little before we give a review.
6. Save the new file (`Ctrl+S`).  
7. In the Git tab, tick the **Staged** box → click **Commit** → add a short message.  
8. Click **Push** to upload changes to GitHub.  

✅ *You’ve published your first commit and uploaded your development branch!*

---

### 🧾 Step 2 — Creating a Pull Request  

Now we want our changes that we made in our own branch to go into production, we should get someone to do a code review.  
Let's go to the repository in our browsers, and have a look if there is an alert about recent pushes/Pull Requests - choose the one you made. They can also be found in Branches/Your Branches. 

1. Open a pull request for the changes you made
2. Review your changes, add a description
3. Submit!  

✅ *You’ve created your first pull request!*

---

### 👀 Step 3 — Review Someone Else’s PR  

1. Go to **Pull Requests tab → Choose a PR made by someone else**.  
2. Review code differences in the tab **Files changed**.  
3. Click **Review changes → Approve** to accept.  
4. Ensure there are no merge conflicts. None found? Good!  
5. Merge changes to main.  

It is safe to delete the branch now as well.

✅ *You’ve now peer reviewed code and merged it into production!*

> 🧩 **Solo workflow tip:**  
> If you’re the only developer, you can skip PRs and work directly on `main` using Stage → Commit → Push.  
> Just remember to fetch the latest updates before editing from another device.  
> It can still be beneficial to create branches for a clearer history with explicit updates.

---

## ⚔️ Editing a Repository (Conflicting Changes)  <a id="️editing-a-repository-conflicting-changes"></a>

### ❓ What is a Git Conflict?  

A Git conflict happens when two people (or two branches) change the same part of the same file in different ways without syncing — and Git can’t decide which one is correct.

When this happens, Git stops the merge and asks you to make the decision manually.

💥 Conflicts often appear when:  
- Someone makes overlapping updates on `main` while you’re working on your branch and you try to merge your branch with it

 A conflict doesn’t appear just because someone changed something in main.
It happens only when your branch is based on an older (“stale”) commit of main, and someone has since made overlapping changes to those same lines.

From Git’s point of view, you’re now trying to edit a line that was already changed in a newer commit, so Git stops and asks:

“These two versions disagree — which one do you want to keep?”

*Note: This applies to any branch that multiple people are updating — not just main.*

---

### 🧠 How to work in a collaborative Git-environment where conflicts arise

Two main strategies exist:

1. Handle conflicts before creating a Pull Request.
Fetch the latest updates from main and merge them into your branch first.
This lets you resolve conflicts early and verify that everything still works before asking for review or merging into main.

2. Or… just open the Pull Request and let someone else deal with the mess.
Maybe the reviewer properly fixes the conflict, maybe they don’t.
Maybe the code even works — we hope for the best. 

👉 We will, of course, choose the first method — because it’s functional, respectful, and doesn’t annoy our teammates.




---

### 🧩 Practicing Merge Conflict Resolution  

1. Go back and verify that you are on `main` branch and click `Pull` in Rstudio - then create a new development branch called `updating_<YourName>` from there for yourself.  
2. In this new branch modify your personal `YourName.R` file and come up with a new entries for the `Message` and `Rating`.
3. Save (CTRL+S), stage, and commit - but do **not push** yet. Let demo presenter know that you are at this point, and ask if you can continue to the next step.  
**Still, no pushing**.
4. Now we as we have made the changes we wanted to make, we should look into the first method of handling possible conflicts. We should fetch the latest updates from main in case there are any and merge them into our branch first before pushing.
4. Fetch and merge updates by writing the following in the **Terminal** tab:

```
git fetch origin 
git merge origin/main
```


---

### 🪄 Reading a Merge Conflict  

You’ll see something like this:

``` 
<<<<<< HEAD
Your version here
======
Incoming version that you fetched
>>>>>> origin/main
```

Solving merge conflicts in Rstudio does not provide us with modern graphical tools, but instead we have to know how to read into the conflict.

`<<<<<<< HEAD` = your local changes (the branch you’re on).

`=======` = separator between versions.

`>>>>>>>` main = the incoming changes from the branch you tried to merge (origin/main in this case).

6. Now choose which lines you want to keep (delete ones you don't want) and delete the conflict markers (<<<<<<<, =======, >>>>>>>) after you’ve chosen which bits to keep.

 💡 In this case you probably want to keep your own changes to publish your own Message and Rating, so delete the line
<<<<<<< HEAD
And everything between 
======= and >>>>>>> origin/main, including the marker lines.

 *Tip: Git doesn’t care what the file looks like after you resolve the conflict — only that the conflict markers are removed.*

7. Save the file, CTRL+S

8. Write the following in the **Terminal** tab:

```
git add <YourName>.R
git commit -m "Resolved merge conflict by keeping my changes"
git push
```

9. When you've made a successful commit, go to Github in your browser, find your branch and create a Pull Request to have someone review your code and implement the changes.

10. When you're done with that, see if others have published Pull Requests and deal with one of them.

 ✅ *You’ve now successfully executed a responsible workflow where Git conflicts get dealt with in a timely manner!*

---

## 🏁 Summary   <a id="️summary"></a>

You now know how to:
- Configure Git and RStudio  
- Clone repositories  
- Create and push branches  
- Open and review pull requests  
- Handle merge conflicts  

> 🎉 **Mission accomplished** 

---

## 📑 Basic Git Commands And Explanations <a id="basic-git-commands-and-explanations"></a>

```
git pull          
```
Fetches and tries to merge updates into your current branch

```
git fetch origin  
```
Fetches updates without applying them, stored locally but not visible in your files

```
git switch <branch_name>
```
Switches to the specified branch
```
git merge origin/main
```
Merges changes from the main branch into your current branch
```
git status
```
Shows the status of your working directory and staging area
```
git log
```
Displays the commit history for the current branch
```
git branch
```
Lists all local branches and highlights the current branch
```
git reset --hard 
```

Resets the current branch to the last committed state, discarding all uncommitted changes
```
git stash
```
Temporarily saves uncommitted changes to a stack for later retrieval
```
git stash pop
```
Applies the most recent stash and removes it from the stash stack

---

# 🔍 Extra-material <a id="extra-material"></a>

>🚀 This would be a good time to have a look at an example of a production README.md file / program documentation that we have for DQC.

>❄️ Connecting to Snowflake   
If you want to use the code in this Demo to actually view and insert data into Snowflake, let me know and I will provide you with the necessary code to do so.   
You will have to create a file called `ENV.R` in your local repository, **for which there is no need to be staging and publishing it as we don't want to push any sensitive data to a public repository.**   
Paste in the code I gave you (replace my email with yours), save the file and you can execute the the code in `YourName.R`.  

>📂 How to create your own repository? 
Ask me and I will show you how to do it!

>⚙️ How to set up branch protection rules? 
Ask me and I will show you how to do it!


