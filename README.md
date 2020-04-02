## Riddler Classic problem from March 27th, 2020 ##
https://fivethirtyeight.com/features/can-you-get-the-gloves-out-of-the-box/

From Chris Nho comes a question of rolling (and re-rolling) a die:

You start with a fair 6-sided die and roll it six times, recording the results of each roll. You then write these numbers on the six faces of another, unlabeled fair die. For example, if your six rolls were 3, 5, 3, 6, 1 and 2, then your second die wouldn’t have a 4 on it; instead, it would have two 3s.

Next, you roll this second die six times. You take those six numbers and write them on the faces of yet another fair die, and you continue this process of generating a new die from the previous one.

Eventually, you’ll have a die with the same number on all six faces. What is the average number of rolls it will take to reach this state?

Extra credit: Instead of a standard 6-sided die, suppose you have an N-sided die, whose sides are numbered from 1 to N. What is the average number of rolls it would take until all N sides show the same number?

### six sided die solution ###
See the file solution_6sides.sql
You can run this in a sqlplus session in a schema where the dice package as been installed.

### General solution for N sided die ###
There are some really nice solutions mentioned on this thread:
https://twitter.com/xaqwg/status/1243537599626690565
People have closed form answers nd are showing that avg nuimber of rolls is linear with the number of faces on the die! (slope 2N)
I might come back and continue this monte-carlo approach so time in the future.

