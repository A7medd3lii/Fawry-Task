# Fawry-Internship-Task
## Question 1 Reflective Section :

## 1. How does your script handle arguments and options?
- I used `getopts` to handle `-n` and `-v` flags.
- The script sets variables (`show_line_numbers` and `invert_match`) depending on the options.
- After parsing, it checks if the user provided both a search string and a filename.
- It also checks if the file exists.
- Based on the options, it prints matching lines, shows line numbers, or shows lines that don't match.

## 2. How would the structure change if regex or `-i`/`-c`/`-l` options were added?
- For regex, I would use `[[ $line =~ $pattern ]]` instead of `grep`.
- For `-i`, no change is needed because the script already ignores case.
- For `-c`, I'd add a counter to count matches and print the total at the end.
- For `-l`, I'd print just the filename if any match is found.
- To keep the script clean, I'd split the code into functions (one function for matching, one for printing, etc.).

## 3. What part of the script was hardest to implement and why?
- The hardest part was making sure `-n` and `-v` work correctly together (especially when both are used like `-vn`).
- Handling argument shifting after options with `getopts` was also tricky to avoid missing parameters.

---

# Bonus 
- I added a `--help` option to show usage info.
- Also used `getopts` to make the script more organized and flexible.


## Question 2 :
## Verify DNS Resolution:
`` dig internal.example.com ``
`` dig @8.8.8.8 internal.example.com ``
i found that the server can't be reached using DNS or 8.8.8.8 

## Temporary Solution:
- Add a manual entry to /etc/hosts file :
`` 172.21.71.213/20  internal.example.com ``

## Test Local DNS Resolution
`` ping internal.example.com ``
it return a reply 

## Test Web Service on Port 80
`` sudo python3 -m http.server 80 ``
the o/p is :
`` Serving HTTP on 0.0.0.0 port 80 (http://0.0.0.0:80/) ... ``

## Test HTTP Response via curl
`` curl http://internal.example.com ``



