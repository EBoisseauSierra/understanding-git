# _"Understanding git"_ course

This repo contains material of a git course for (and by) the Data Science team.
The course is intended for both novice and those who use git yet sometime struggle to know which command to use to fix the mess of their repo.

## Objective

The objective of this course is to provide a simple _understanding_ of how git works.
We firmly believe that this will make the process of _learning_ (and then _using_) git easier.
No prior exposure to git is required.

## Outline

The course is divided into 5 chapters.
You will find below the main points addressed in each chapter.

1. Git, an overview
    - Situations where git is useful
    - git as a VCS
    - Overview of git workflow
    - Caveat
2. What happens at the file-level
    - The 5 file states
    - The circle of life (of a file)
    - Anatomy of a commit
    - Knowing where you are
    - Undoing things
    - Advanced commands
3. What happens at the repo-level
    - A family tree
    - It is all about pointers
    - Meet your HEAD
    - A tree has branches
    - Branching out
    - Merging branches - Rebasing
    - Still pointers: Meet tags
4. What happens at the distributed-level
    - Distributed VCS
    - Distributed VCS in practice at Unipart
    - Creating a new repo: keep it simple
    - Letting the remote know about your changes
    - Knowing about changes in the remote
    - Keeping everything synchronized
    - What does using remote repos implies
5. How to efficiently collaborate in the DS team
    - Branching system used in the Data Science team
    - One User-story = one branch
    - Using Pull Requests to merge your branch
    - Update your branch via rebasing
    - Rolling out changes to production
    - Writing good commit messages

## Using this repo

### Getting the slides

The lastest _released_ (pdf) version of the slides are to find in the `slides/` folder.
This is the easiest way to go, should you just want to use or have a look at them.

### Modifying the slides

The source for the slides are to find in the `.svg` files.
As you might have noticed, each chapter correspond to a single `.svg` file.
Each slide of the presentation corresponds to a layer of this file — the first slide being the bottomest layer.

We recommend that you use [Inkscape](https://inkscape.org) for modifying them.

### Generating PDF from the SVG files

Once you have modified the source files, you might want to export a new set of slides.
We have added a script (to be found in the `create_pdf_from_svg_layers.sh` file) that automate the export of layers as pages of a single PDF.

To use this script, first give it sufficient rights, so that it can be executed on your machine:
```
chmod +x create_pdf_from_svg_layers.sh
```

Then, simply run the following command:

```
./create_pdf_from_svg_layers.sh <file_name>.svg
# for example:
# ./create_pdf_from_svg_layers.sh 04_data-science_workflow/04_data-science_workflow.svg
```

This script will create one `temp***.pdf` file per layer in your working directory (this might take circa one second per layer), merge them all, and finally put the result in a `<file_name>.pdf` file located where the `.svg` one is.
Of course, the script is well-mannered and it will clean temporary files up.

Notes:

- Current export script only works if layers IDs actually start with `layer`.
  Note that it is not the case if you duplicate a layer in Inkscape (vs. creating a new one).
  (We are planning to `grep` elements through their `inkscape:groupmode` — which is in both case equal to `"layer"` — to tackle this issue.)
- Our script will create one slide per layer found in the `.svg` file… but will export content of _visible_ layers only.
  You might then want to double-check all layers are visible when exporting.
