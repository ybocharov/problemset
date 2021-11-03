# Problem 1:

Two non-negative integers are called siblings if they can be obtained from each other by rearranging the digits of their decimal representations. For example, 123 and 213 are siblings. 535 and 355 are also siblings.
A set consisting of a non-negative integer N and all of its siblings is called the family of N. For example, the family of 553 comprises three numbers: 355, 535 and 553.

Write a function: def solution(N)

Such that, given a non-negative integer N, returns the largest number in the family of N. The function should return -1 if the result exceeds 100,000,000.
For example, given N = 213 the function should return 321. Given N = 553 the function should return 553.

Write an efficient algorithm for the following assumptions:
N is an integer within the range [0..2,147,483,647].

# Problem 2:

There is a forum that has a limit of K characters per entry. In this task your job is to implement an algorithm for cropping messages that are too
long. You are given a message, consisting of English alphabet letters and spaces, that might be longer than the limit. Your algorithm should crop a
number of words from the end of the message, keeping in mind that:
it may not crop away part of a word;
the output message may not end with a space;
the output message may not exceed the K-character limit;
the output message should be as long as possible.
This means that, in some cases, the algorithm may need to crop away the entire message, outputting an empty string.
For example, given the text:
"Codility We test coders"
With K = 14 the algorithm should output:
"Codility We"
Note that:
the output "Codility We te" would be incorrect, because the original message is cropped through the middle of a word;
the output "Codility We " would be incorrect, because it ends with a space;
the output "Codility We test coders" would be incorrect, because it exceeds the K-character limit;
the output "Codility" would be incorrect, because it is shorter than the correct output.

Write a function
def solution(message, K)
which, given a message and an integer K, returns the message cropped to no more than K characters, as described above.
Examples:

1. Given message = "Codility We test coders" and K = 14, the function should return "Codility We".
2. Given message = "Why not" and K = 100, the function should return "Why not".
3. Given message = "The quick brown fox jumps over the lazy dog" and K = 39, the function should return "The quick brown fox
   jumps over the lazy".
4. Given message = "To crop or not to crop" and K = 21, the function should return "To crop or not to".
   Assume that:
   K is an integer within the range [1..500];
   message is a non-empty string containing at most 500 English alphabet letters and spaces. There are no spaces at the beginning
   or at the end of message; also there can't be two or more consecutive spaces in message.
   In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.

# Problem 3:
A word machine is a system that performs a sequence of simple operations on a stack of integers. Initially the stack is empty. The sequence of
operations is given as a string. Operations are separated by single spaces. The following operations may be speci..ed:
an integer X (from 0 to 2 - 1): the machine pushes X onto the stack;
"POP": the machine removes the topmost number from the stack;
"DUP": the machine pushes a duplicate of the topmost number onto the stack;
"+": the machine pops the two topmost elements from the stack, adds them together and pushes the sum onto the stack;
"-": the machine pops the two topmost elements from the stack, subtracts the second one from the ..rst (topmost) one and pushes
the difference onto the stack.
After processing all the operations, the machine returns the topmost value from the stack.
The machine processes 20-bit unsigned integers (numbers from 0 to 2 - 1). An over..ow in addition or under..ow in subtraction causes an error.
The machine also reports an error when it tries to perform an operation that expects more numbers on the stack than the stack actually contains.
Also, if, after performing all the operations, the stack is empty, the machine reports an error.

For example, given a string "4 5 6 - 7 +", the machine performs the following operations:
<pre>
operation | comment           | stack
          |                   | [empty]
      "4" | push 4            | 4
      "5" | push 5            | 4, 5
      "6" | push 6            | 4, 5, 6
      "-" | subtract 5 from 6 | 4, 1
      "7" | push 7            | 4, 1, 7
      "+" | add 1 and 7       | 4, 8
</pre>
Finally, the machine will return 8.

Given a string "13 DUP 4 POP 5 DUP + DUP + -", the machine performs the following operations:
<pre>
operation | comment              | stack
          |                      | [empty]
     "13" | push 13              | 13
    "DUP" | duplicate 13         | 13, 13
      "4" | push 4               | 13, 13, 4
    "POP" | pop 4                | 13, 13
      "5" | push 5               | 13, 13, 5
    "DUP" | duplicate 5          | 13, 13, 5, 5
      "+" | add 5 and 5          | 13, 13, 10
    "DUP" | duplicate 10         | 13, 13, 10, 10
      "+" | add 10 and 10        | 13, 13, 20
      "-" | subtract 13 from 20  | 13, 7
</pre>
      
Finally, the machine will return 7.

Given a string "5 6 + -", the machine reports an error. After the addition, there is only one number on the stack and the subtraction operation expects two.

Given a string "3 DUP 5 - -", the machine reports an error. The second subtraction yields a negative result.

Write a function: def solution(S)

that, given a string S containing a sequence of operations for the word machine, returns the result the machine would return after processing the operations. The function should return -1 if the machine would report an error while processing the operations.
Examples:

1. Given S = "4 5 6 - 7 +", the function should return 8, as explained above.
2. Given S = "13 DUP 4 POP 5 DUP + DUP + -" the function should return 7.
3. Given S = "5 6 + -", the function should return -1.
4. Given S = "3 DUP 5 - -", the function should return -1.
   Assume that:
   the length of S is within the range [0..2,000];
   S is a valid sequence of word machine operations.
   In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
