Syntax for using semantic commit messages | [git]

# Syntax

The following structure should be used when using semantic commit messages.

```git
type(scope): subject
```


# Types

## ✨ feat

The feat type is used when any new functionality has been added to the codebase.

## 🪲 fix
The fix type is used for bug fixes to existing features.

## ⚡️ perf
This type is used when the commit contains performance improvements to existing code.

## 🚀 ci
The ci type is used to identify development changes related to the continuous integration and deployment system such as scripts, configurations or tools.

## ♻️ refactor
The refactor type is used to identify development changes related to modifying the codebase by moving code, changing variable names or similarly without changing functionality.

## 🎨 style
The style type is used to identify development changes related to styling the codebase, regardless of the meaning - such as indentations, semi-colons, quotes, trailing commas and so on.

## 🧪 test
The test type is used when tests have been changed.

## 📃 docs

The docs type is used to identify documentation changes related to the project - whether intended externally for the end users (in case of a library) or internally for the developers.

# Usage

What is the point of using semantic commit messages?

## Separability

If the repo is using only semantic commits the structure forces developers to  make more homogenous decisions based on what a commit should and should not contain. Too often I see multiple 'commits' (maybe one fix and a refactor) packed in into one resulting in less control of the code base. This is obviously very bad when one of those code changes needs reverting, since that 

## Git history

When all commits in a repo are using semantic commits there are some gained advantages similar to when using structured logging. This makes us able to filter certain commits by type for example.   

```powershell
git log --oneline --grep "^feat" 
```

## CD/CI

These commits could lay ground for the ci/cd process. An example is where `feat` commit may increase a major/minor of the version automatically, `fix` increases re other types may increase patch/build/revision numbers of the version.

