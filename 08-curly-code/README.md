# 08-curly-code

One script, `penguin-report.R`, of the kind that turns up when a quick look
became a report and nobody went back over it.

It runs. It produces a plot, a table and a `report.csv`. Nothing here is
broken in a way that stops you, which is what makes it worth reviewing.

## How to run it

Set your working directory to this folder, or open the `.Rproj` at the top of
the repo and adjust the path. The script reads `penguins.csv` from beside
itself.

```r
source("penguin-report.R")
```

Note the output before you change anything. You will want to compare against
it later.

## The exercise

Work the review process in order. The point of the order is that the machine
does the mechanical pass so that you can spend your attention on the thinking.

**1. Run the automated checks.**

```r
flir::lint("penguin-report.R")
```

or, if you have jarl:

```bash
jarl check penguin-report.R
```

Then format it:

```bash
air format penguin-report.R
```

**2. Read it top to bottom and change nothing.** Mark the places where it
caught you.

**3. Chunk it up.** How many ideas are in here? Write the number down before
you count the lines.

**4. Can you say what each chunk is for, in a sentence?**

**5. Re-express one chunk.** Then run it again and check the output has not
moved.

## What the tools will and will not find

The linter finds 55 things across 23 rules. Fifty of those it will fix for
you. That is the mechanical pass, and it takes about a second.

Then read what is left. The tools have nothing to say about:

- names that tell you nothing
- the same work written out three times with one value changed
- objects that are created and never used again
- commented-out code that somebody might come back to
- whether any of this answers the question in the first line of the file

Those are the review. That is the whole point of doing the automated pass
first.

## Do not tidy this folder

Being awful is its job.
