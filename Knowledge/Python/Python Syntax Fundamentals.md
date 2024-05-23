
---
```ad-important
Some concepts in this document are going to be referenced out of order, meaning you will see words or concepts you don't understand, that are then later explained in much greater detail as you continue to read and learn.  You will see references to things like **arguments**, **functions**, and **variables** that are then explained later on.
```
### Strings

- **Definition:** A string is a sequence of characters enclosed in single (`'`) or double (`"`) quotes.

```ad-info
Strings are used to **represent and manipulate text in programming**. They are sequences of characters and are essential for tasks that involve displaying, processing, or storing textual information. Strings are versatile and can be used for a wide range of applications, including:

1. **User Interaction**: Displaying messages, prompts, and receiving input from users.
2. **Data Storage**: Storing text data such as names, addresses, or any other type of textual information.
3. **File Manipulation**: Reading from or writing to text files.
4. **Communication**: Sending and receiving text-based data over networks.
5. **Formatting and Parsing**: Creating formatted text for reports, logs, or other outputs and parsing text data for processing.
```

#### Examples of When Strings Would Be Appropriate to Use

##### Example 1: Displaying Messages to Users
```python
# Displaying a welcome message
welcome_message = "Welcome to the Python Programming Course!"
print(welcome_message)
```

**Explanation:**

- **Line 2:** The **string** is `"Welcome to the Python Programming Course!"`.  It is stored in the variable `welcome_message` (more on **variables** below).
- **Line 3:** `print(welcome_message)`(more on `print` below) displays the message to the user via a terminal.

##### Example 2: Receiving User Input
```python
# Asking the user for their name
name = input("Enter your name: ")

# Greeting the user
greeting = "Hello, " + name + "!"
print(greeting)
```

**Explanation:**

- **Line 2:** `input("Enter your name: ")` prompts the user to enter their name.
- **Line 5:** The greeting message is constructed using **string concatenation**.
- **Line 6:** `print(greeting)` displays the personalized greeting.
  
**Output:**
If the user enters "Wes" when prompted, the output will be:
```python
Enter your name: Wes
Hello, Wes!
```

##### Example 3: Storing and Processing Text Data
```python
# Storing a list of student names
students = ["Alice", "Bob", "Charlie", "Diana"]

# Printing the names
for student in students:
    print("Student:", student)
```

**Explanation:**

- **Line 2:** A list of strings (more on **lists** below), `students`, is defined to store student names.
- **Lines 5-6:** A`for` loop (more on `for` **loops** below) iterates through the list and prints each name.  The `for` loop iterates over each element in the `students` list.  `student` is a **loop variable** that takes on the value of each element (each name in this scenario) in the `students` list during each iteration of the loop.  The line `for student in students:` means "for each element (name) in the `students` list, assign the element to the variable `student`, and then execute the indented code block."
  
**Final Output**:
```python
Student: Alice
Student: Bob
Student: Charlie
Student: Diana
```

##### Example 4: Reading from a Text File
```python
# Reading lines from a text file
with open("example.txt", "r") as file:
    content = file.read()

# Printing the file content
print(content)
```

**Explanation:**

- **Line 2:** The `open()` function (more on **functions** below) opens the file `example.txt` in read mode.
- **Line 3:** The `read()` method (more on **methods** below) reads the entire content of the file into the string `content`.
- **Line 6:** `print(content)` displays the content of the file.


##### Example 5: Sending Text Data Over a Network
```python
# Simulating sending a message over a network
def send_message(message):
    print("Sending message:", message)

# Defining a message
message = "Hello, this is a network message!"

# Sending the message
send_message(message)
```

- **Explanation:**
	- **Line 2:** A function `send_message()` is defined to simulate sending a message.
	- **Line 6:** The **string** based variable `message` is defined with the content to be sent.  Notice that `message` is defined after the function call `send_message` referencing it is defined.
	- **Line 9:** `send_message(message)` calls the function to send the message.

- ##### Understanding Scope and Order of Execution in Python
	- In Python, the scope and order of execution play crucial roles in how variables and functions are referenced and used. Let's break down the concepts involved in the above example:

**Function Definition**:
```python
def send_message(message):
    print("Sending message:", message)
```

- Here, `send_message` is a function that takes one argument, `message`.
	- This function is defined first, but it **does not execute until it is called**.  
		- When you write a function in Python, you're essentially giving the computer a set of instructions that it can follow later, but not right away. Think of it like writing a recipe. The recipe (function) is written down first, but the actual cooking (executing the function) doesn't happen until you decide to use the recipe.
	- The `message` parameter is **local to the function scope**.

```ad-important
Understanding Local and Global Scope in Python

In Python, the scope of a variable determines the region of the code where that variable is accessible. There are two main types of scope:

1. **Global Scope**:
    
    - Variables defined at the **top level of a script or module**, outside of any function or class, are in the global scope.
    - These variables are **accessible from anywhere in the code after they are defined**.
2. **Local Scope**:
    
    - Variables defined **inside a function or class are in the local scope**.
    - These variables are **only accessible within the function or class where they are defined**.
```


**Variable Definition**:
```python
message = "Hello, this is a network message!"
```

- This line defines a variable `message` with a string value.
- This `message` variable is in the **global scope**, meaning it is accessible anywhere in the code following its definition.
- When you pass a variable as an argument to a function, the **value of that variable is used within the function**, not the variable itself.

- ##### Another example:
```python
 # Defining a function with two arguments,"a" and "b"
def add_numbers(a, b):
    return a + b

# Defining two variables which are numbers which are in the global scope.  The "a + b" of the function determines that the arguments will need to be numbers.
num1 = 10
num2 = 20

# Calling the function with the variables as arguments, which are local to the add_numbers function
result = add_numbers(num1, num2)

# Printing the result
print("The sum is:", result)
```

1.  **Function Definition**:
    
    - `def add_numbers(a, b):` defines a function `add_numbers` with arguments (local) `a` and `b`.
2. **Variable Definition**:
    
    - `num1 = 10` defines a global variable `num1` with the value `10`.
    - `num2 = 20` defines a global variable `num2` with the value `20`.
3. **Function Call with Arguments**:
    
    - `add_numbers(num1, num2)` calls the function `add_numbers` with `num1` and `num2` as arguments.
    - Inside the function, `a` is assigned the value of `num1` (10) and `b` is assigned the value of `num2` (20).
4. **Result**:
    
    - The function computes the sum `a + b` (10 + 20) and returns `30`.
    - `result` is assigned the returned value `30`.
- `print("The sum is:", result)` outputs `The sum is: 30`.

**Function Call**:
```python
send_message(message)
```

- `send_message(message)` calls the `send_message` function, passing the global `message` variable as an argument.
- Inside the function, the local parameter `message` is assigned the value of the global `message` variable, which is `"Hello, this is a network message!"`.
- The function executes `print("Sending message:", message)`, printing the message to the console.

##### Example 6: Formatting Text
```python
# Using f-strings to format text
name = "Alice"
age = 25

# Creating a formatted string
info = f"Name: {name}, Age: {age}"

# Printing the formatted string
print(info)
```

**Explanation:**

- **Lines 2-3:** Variables `name` and `age` are defined.
- **Line 6:** An f-string (more on **f-strings** below) is used to create a formatted string `info`.
- **Line 9:** `print(info)` displays the formatted text.

**Output**
```python
Name: Alice, Age: 25
```

---
### Numbers

**Definition:** Numbers in Python can be integers (whole numbers) or floating-point numbers (decimals).

```python
# Defining an integer and a float
integer_number = 42
float_number = 3.14

# Performing arithmetic operations
sum_result = integer_number + float_number
product_result = integer_number * float_number

# Printing the numbers and results
print("Integer:", integer_number)
print("Float:", float_number)
print("Sum:", sum_result)
print("Product:", product_result)
```

**Explanation:**

- **Line 2:** `integer_number = 42` defines an **integer**.
- **Line 3:** `float_number = 3.14` defines a **floating-point number**.

```python
sum_result = integer_number + float_number
```

- This line performs an **addition operation**.
- `integer_number + float_number` adds the values of `integer_number` (42) and `float_number` (3.14).
- The result of the addition (45.14) is stored in the variable `sum_result`.

```python
product_result = integer_number * float_number
```

- This line performs a **multiplication operation**.
- `integer_number * float_number` multiplies the values of `integer_number` (42) and `float_number` (3.14).
- The result of the multiplication (131.88) is stored in the variable `product_result`.

##### Output
```python
Integer: 42
Float: 3.14
Sum: 45.14
Product: 131.88
```

#### Understanding Arithmetic in Python

Python supports basic arithmetic operations such as addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`), and more.

```ad-info
Numbers in Python are used to represent numerical data and perform mathematical calculations. They come in various types, each serving different purposes:

1. **Integers (`int`)**:
    
    - Whole numbers, positive or negative, without decimals.
    - Examples: `42`, `-7`, `0`.
2. **Floating-point numbers (`float`)**:
    
    - Numbers with a decimal point.
    - Examples: `3.14`, `-0.001`, `2.0`.
3. **Complex numbers (`complex`)**:
    
    - Numbers with a real and an imaginary part.
    - Example: `3 + 4j`.
```

#### Situational Examples of Why Numbers Would Be Used Over Strings of Numbers

##### 1. Mathematical Calculations

**Example: Calculating the Area of a Circle**
```python
radius = 5
pi = 3.14159
area = pi * (radius ** 2)
print("The area of the circle is:", area)
```

**Explanation:**

- Here, `radius` and `pi` are used as floating-point numbers.
- Mathematical operations like exponentiation (`**`) and multiplication (`*`) are performed.
- Using strings for these operations would be cumbersome and inefficient, as you would have to convert them to numbers before performing calculations.

##### 2. Performance Optimization

**Example: Summing a Large List of Numbers**
```python
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
total = sum(numbers)
print("The total is:", total)
```

**Explanation:**

- When summing a list of numbers, using integers is much faster than converting strings to integers and then summing them.
- Python’s `sum()` function directly operates on numeric data types, making the operation efficient.

##### 3. Sorting and Comparing

**Example: Sorting a List of Scores**
```python
scores = [89, 92, 78, 95, 88]
sorted_scores = sorted(scores)
print("Sorted scores:", sorted_scores)
```

**Explanation:**

- Sorting numeric data directly is straightforward and efficient.
- If scores were stored as strings, the sorting would be lexicographical (e.g., `"100"` comes before `"20"`), leading to incorrect results for numerical comparisons.
  
##### Output
```python
Sorted scores: [78, 88, 89, 92, 95]
```

##### Explanation of `sorted()`

The `sorted()` function in Python is used to **sort elements of a list**, or any other iterable **in a specific order**. By default, `sorted()` sorts the elements in **ascending order**. Here's how it works:

1. **Function Call**:
    
    - `sorted(scores)` is called with the list `scores` as the **argument**.
2. **Sorting Process**:
    
    - The `sorted()` function takes the list of numbers and compares each element to determine their order.
    - It uses a comparison-based sorting algorithm to arrange the elements from the smallest to the largest.
3. **Returning the Result**:
    
    - The function **returns a new list containing the sorted elements**, which is stored in the variable `sorted_scores`.

---
### Arguments

Arguments are **values that you pass to a function when you call it**. They are used by the function to perform operations.

```ad-info
Arguments are **values that are passed to functions** (or methods) when they are called. **They provide the function with the data it needs to operate**.

**Types of Arguments:**

- **Positional Arguments**: Arguments that need to be provided in the exact order defined in the function.
- **Keyword Arguments**: Arguments that are specified by the name of the parameter.
- **Default Arguments**: Arguments that assume a default value if a value is not provided.
- **Variable-length Arguments**: Functions that can accept an arbitrary number of arguments using `*args` (for non-keyword arguments) and `**kwargs` (for keyword arguments).


```

#### Examples of different types of arguments:
```python
# 'age' is a default argument as it has a default value of 25
def greet(name, age=25):  
    print(f"Hello, {name}. You are {age} years old.")

# Positional argument
greet("Alice")

# Keyword argument
greet(age=30, name="Bob")

# Mixing positional and keyword arguments
greet("Charlie", age=35)

# Variable-length arguments
def print_numbers(*args):
    for number in args:
        print(number)

print_numbers(1, 2, 3, 4)
```

##### Default Arguments

**Definition:** A default argument is an argument that **assumes a default value if a value is not provided** in the function call. Default arguments are specified in the function definition.

**Explanation:**

- In the function `greet`, `age` is a default argument with a default value of `25`.
- If `age` is not provided when calling `greet`, it defaults to `25`.

##### Positional Arguments

**Definition:** Positional arguments are arguments that need to be provided **in the exact order defined in the function**.

**Explanation:**

- `greet("Alice")` calls the `greet` function with `"Alice"` as the positional argument for `name`, which is the first argument defined in the function `greet(name, age=25)`.
- Since `age` is not provided, it uses the default value `25`.

##### Keyword Arguments

**Definition:** Keyword arguments are arguments passed to a function by explicitly specifying the parameter name and value. This **allows the arguments to be provided in any order**.

**Explanation:**

- In the call `greet(age=30, name="Bob")`, even though the order of arguments is reversed, it still works because the parameter names (`name` and `age`) are explicitly specified.
- The function `greet` receives `name` as `"Bob"` and `age` as `30`.

#### Mixing Positional and Keyword Arguments

You can mix positional and keyword arguments in a function call, but **positional arguments must come before keyword arguments**.

```python
def greet(name, age=25):
    print(f"Hello, {name}. You are {age} years old.")

# Mixing positional and keyword arguments
greet("Charlie", age=35)  # This works
```

**Explanation:**

- In the call `greet("Charlie", age=35)`, `"Charlie"` is provided as a positional argument for `name`, and `35` is provided as a keyword argument for `age`.
##### Final Output
```python
Hello, Alice. You are 25 years old.
Hello, Bob. You are 30 years old.
Hello, Charlie. You are 35 years old.
1
2
3
4
```

#### How functions use arguments:
**Example:**
```python
# Defining a function with two arguments
def add_numbers(a, b):
    return a + b

# Calling the function with arguments 3 and 5
result = add_numbers(3, 5)

# Printing the result
print("The sum is:", result)
```

**Explanation:**

- **Line 2:** `def add_numbers(a, b):` defines a function named `add_numbers` that takes two arguments, `a` and `b`.
- **Line 3:** `return a + b` returns the sum of `a` and `b`.
- **Line 6:** `add_numbers(3, 5)` calls the function with arguments `3` and `5`.
- **Line 9:** `print("The sum is:", result)` prints the result.
##### Output
```python
The sum is: 8
```
---
### Variables

Variables are used to store data that can be referenced and manipulated in your code. They act as placeholders for values.

```ad-info

```

**Example:**
```python
# Creating a variable to store a number
age = 25

# Creating a variable to store a string
name = "Alice"

# Printing the variables
print("Name:", name)
print("Age:", age)
```

**Explanation:**

- **Line 2:** `age = 25` assigns the value `25` to the variable `age`.
- **Line 5:** `name = "Alice"` assigns the string `"Alice"` to the variable `name`.
- **Lines 8-9:** `print()` outputs the values of `name` and `age`.
---
### Functions

Functions are blocks of reusable code that perform a specific task. They can take inputs (arguments) and return outputs.

**Example:**
```python
# Defining a function that prints a greeting
def greet(name):
    print("Hello, " + name + "!")

# Calling the function with the argument "Alice"
greet("Alice")
```

**Explanation:**

- **Line 2:** `def greet(name):` defines a function named `greet` that takes one argument, `name`.
- **Line 3:** `print("Hello, " + name + "!")` prints a greeting message.
- **Line 6:** `greet("Alice")` calls the function with the argument `"Alice"`.
---
### Booleans

Booleans are a data type that can hold one of two values: `True` or `False`. They are often used in conditional statements.

**Example:**
```python
# Creating boolean variables
is_sunny = True
is_raining = False

# Using booleans in an if statement
if is_sunny:
    print("It's a sunny day!")
else:
    print("It's not sunny today.")
```

**Explanation:**

- **Line 2:** `is_sunny = True` assigns the boolean value `True` to the variable `is_sunny`.
- **Line 3:** `is_raining = False` assigns the boolean value `False` to the variable `is_raining`.
- **Lines 6-8:** An `if` statement checks the value of `is_sunny`. If it's `True`, it prints "It's a sunny day!"; otherwise, it prints "It's not sunny today."
---
### Lists

Lists are ordered collections of items. You can store multiple values in a single list and access them using their index.

**Example:**
```python
# Creating a list of numbers
numbers = [1, 2, 3, 4, 5]

# Accessing the first element (index 0) of the list
first_number = numbers[0]

# Printing the list and the first element
print("Numbers:", numbers)
print("First number:", first_number)
```

**Explanation:**

- **Line 2:** `numbers = [1, 2, 3, 4, 5]` creates a list containing the numbers `1` to `5`.
- **Line 5:** `first_number = numbers[0]` accesses the first element of the list (index `0`) and assigns it to `first_number`.
- **Lines 8-9:** `print()` outputs the list and the first element.
---
### Dictionaries

Dictionaries are collections of key-value pairs. Each key is unique and is used to access the corresponding value.

**Example:**
```python
# Creating a dictionary with name-age pairs
person = {"name": "Alice", "age": 25}

# Accessing values using keys
name = person["name"]
age = person["age"]

# Printing the values
print("Name:", name)
print("Age:", age)
```

**Explanation:**

- **Line 2:** `person = {"name": "Alice", "age": 25}` creates a dictionary with keys `"name"` and `"age"` and the values `"Alice"` and `25` respectively.
- **Lines 5-6:** `name = person["name"]` and `age = person["age"]` access the values associated with the keys.
- **Lines 9-10:** `print()` outputs the values.
---
### Loops

Loops are used to repeat a block of code multiple times. The most common types of loops are `for` loops and `while` loops.

**Example of a `for` loop:**
```python
# Creating a list of numbers
numbers = [1, 2, 3, 4, 5]

# Using a for loop to iterate through the list
for number in numbers:
    print("Number:", number)
```

**Explanation:**

- **Line 2:** `numbers = [1, 2, 3, 4, 5]` creates a list of numbers.
- **Lines 5-6:** `for number in numbers:` iterates through each element in the list, and `print("Number:", number)` prints each element.

**Example of a `while` loop:**
```python
# Initializing a counter
count = 0

# Using a while loop to repeat until the condition is false
while count < 5:
    print("Count:", count)
    count += 1  # Incrementing the counter
```

**Explanation:**

- **Line 2:** `count = 0` initializes the counter variable.
- **Lines 5-7:** `while count < 5:` checks if `count` is less than `5`. If true, it prints the value of `count` and increments it by `1`.
---
### Conditional Statements

Conditional statements (`if`, `elif`, `else`) are used to perform different actions based on different conditions.

**Example:**
```python
# Asking the user for their age
age = int(input("Enter your age: "))

# Checking the age and printing a message
if age < 18:
    print("You are a minor.")
elif 18 <= age < 65:
    print("You are an adult.")
else:
    print("You are a senior.")
```

**Explanation:**

- **Line 2:** `age = int(input("Enter your age: "))` captures user input and converts it to an integer.
- **Lines 5-10:** An `if-elif-else` statement checks the value of `age` and prints the corresponding message.
---
