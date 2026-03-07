# WEEK 1: Python Fundamentals 
# Course: "Generation Python" for beginners (Stepik) 
# Syllabus: https://stepik.org/course/58852/syllabus

# MODULE 1: Introduction and key info about the course

# MODULE 2: Data Input and Output
# Topics: print() and input() functions, variables, 'sep' and 'end' parameters, 
# basic operations (+, -, *, /), power, floor division, and modulo.

# Task: Build a program that outputs this asterisk (*) triangle:
print('*')
print('**')
print('***')
print('****')
print('*****')
print('******')
print('*******')

# Task: Write a program that takes three lines of input and prints them in reverse order, each on a new line.
a = input()
b = input()
c = input()

print(c)
print(b)
print(a)

# Task: Write a program that reads a separator and three strings, then outputs the strings 
# joined by the separator in the following format:
# <2><separator><2><separator><4>
a = input()
b = input()
c = input()
d = input()

print(b, a, c, a, d, sep='')

# Task: Given a seat number, find the corresponding compartment number in a 9-compartment 
# carriage (4 seats per compartment, starting from seat 1).
n = int(input())
print((n - 1) // 4 + 1)

# Task: Given a three-digit number with unique digits, write a program that outputs all six possible permutations of its digits.
a = int(input())
x = a // 100
y = (a % 100) // 10
z = a % 10
print(x, y, z, sep = '')
print(x, z, y, sep = '')
print(y, x, z, sep = '')
print(y, z, x, sep = '')
print(z, x, y, sep = '')
print(z, y, x, sep = '')

# Task: Write a program to extract and display the individual digits of a four-digit number.
a = int(input())
x = a // 1000
y = a % 1000 // 100
z = a % 100 // 10
h = a % 100 % 10
print('Thousands digit is', x)
print('Hundreds digit is', y)
print('Tens digit is', z)
print('Units digit is', h)

# MODULE 3: Module 2 Exam
# Completed successfully with 30/30 score

# MODULE 4: Ternary Operator
# Topics: Branching, logical operators (and, or, not), nested conditions, cascaded conditions.

# Task: Write a program to find the minimum of four numbers.
a = int(input())
b = int(input())
c = int(input())
d = int(input())

ab = 0
if a > b:
    ab = ab + b
else:
    ab = ab + a

cd = 0
if c > d:
    cd = cd + d
else:
    cd = cd + c

if ab > cd:
    print(cd)
else:
    print(ab)

# Task: Create a program to categorize a user's age into the following groups: 0–13 (Childhood), 
# 14–24 (Youth), 25–59 (Adulthood), 60+ (Old age).
age = int(input())
if age <= 13:
    print('Childhood')
if 14 <= age <= 24:
    print('Youth')
if 25 <= age <= 59:
    print('Adulthood')
if age >= 60:
    print('Old age')

# Task: Given two distinct chessboard squares, determine if a King can move from the first to the second in a single move. 
# Input: four integers (1–8) representing column and row indices. Output: YES or NO.
x1 = int(input())
y1 = int(input())
x2 = int(input())
y2 = int(input())

if -1 <= x1 - x2 <= 1 and -1 <= y1 - y2 <= 1:
    print('YES')
else:
    print('NO')

# Task: Write a program to determine the color of a roulette wheel pocket (0–36) based on its number. Output: "Green", "Red", or "Black".
a = int(input())
if 0 <= a <= 36:
    if a == 0:
        print('green')
    elif 1 <= a <= 10:
        if a % 2 == 0:
            print('black')
        else:
            print('red')
    elif 11 <= a <= 18:
        if a % 2 == 0:
            print('red')
        else:
            print('black')
    elif 19 <= a <= 28:
        if a % 2 == 0:
            print('black')
        else:
            print('red')
    elif 29 <= a <= 36:
        if a % 2 == 0:
            print('red')
        else:
            print('black') 
else:
    print('error')

# THE END OF WEEK 1
print("Week 1 of Python course completed successfully!")





