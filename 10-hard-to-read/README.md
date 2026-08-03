# 10-hard-to-read

A hundred line script that runs, is formatted, and tells you nothing.

This is the running example in **chapter 3, writing readable code**. It is a
real analysis of mine from [ozed](https://github.com/njtierney/ozed) - how many
Australians are studying, by age group and state, from an ABS spreadsheet -
with the variable names taken off it.

It is the same script printed in the chapter, so you can work from either.

## Run it first

```r
source("analysis.R")
```

It works. That is the point of it. A linter has almost nothing to say, `{air}`
will barely change it, and it still takes ten minutes to understand.

## What to do with it

**1. Fix the names.** Most of them are already OK - `data_studying`,
`data_population` and `data_joined` all say what they hold. Three are worth
five seconds each: `data`, `data_subset` and `the_names2`.

Rename them with **Rename in Scope** (`Cmd / Ctrl + Shift + Alt + M`) or `F2`,
not find and replace, because replacing `data` will reach into `data_studying`
and `data_subset` too.

Aim for OK names, not great ones.

Then answer this: **what is `the_names2`, and why are there two?** Something
becomes visible once the names are fixed that was invisible before.

**2. Chunk it.** Read it once and put a blank line and a comment wherever the
*subject* changes. Do not fix anything. How many ideas are in a hundred lines?

Then: are any two of those chunks doing the same thing to different data? And
if someone asked you to add another year, how many lines would you have to
touch?

**3. Keep going, if you want.** The chapter takes this script the rest of the
way in the functions chapter, until adding a year is one argument. Every
intermediate step is in the [ozed repo](https://github.com/njtierney/ozed),
one script per step.

## Data

`data/Education and work, 2023, Datacube 2 (Table 11).xlsx` is the real
[ABS](https://www.abs.gov.au/statistics/people/education/education-and-work-australia/latest-release)
workbook, one sheet per year. The script reads the 2014 sheet.
