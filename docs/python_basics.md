# 🐍 Python Basics

## 🎯 Key Characteristics of Python

- **Interpreted** and **cross-platform** language
- **Clean and readable** syntax
- **Dynamically typed**: no need to explicitly declare types
- **Strongly typed**: type mismatches are not allowed
- **Multiparadigm**: supports structured, object-oriented, and functional programming

---

## 🔢 Basic Data Types

| Type   | Example                 | Description                                  |
|--------|-------------------------|----------------------------------------------|
| `int`  | `age = 30`              | Integers, without decimal point              |
| `float`| `height = 1.75`         | Decimal numbers                              |
| `str`  | `name = "Diego"`        | Text strings                                 |
| `bool` | `active = True`         | Booleans (`True` / `False`)                  |
| `list` | `colors = ["red"]`      | Ordered and **mutable** list                 |
| `tuple`| `point = (10, 20)`      | Ordered and **immutable** tuple              |
| `dict` | `{"name": "Diego"}`     | Key-value dictionary                         |
| `set`  | `{1, 2, 3}`             | Unordered collection with **no duplicates**  |

---

## 🔁 Flow Control

### Conditionals

```python
if age >= 18:
    print("Adult")
else:
    print("Minor")
```

### Loops

```python
for color in colors:
    print(color)

while counter < 3:
    print(counter)
    counter += 1
```

---

## ⚙️ Functions

```python
def greet(name):
    return f"Hello, {name}"
```

- Use `def` to define a function
- Use `return` to return a value
- Optionally annotate argument types and return type:

```python
def greet(name: str) -> str:
    return f"Hello, {name}"
```

---

## 🛠 Practical example: Separate Even and Odd Numbers

```python
def separate_even_odd(numbers):
    evens = []
    odds = []
    for number in numbers:
        if number % 2 == 0:
            evens.append(number)
        else:
            odds.append(number)
    return evens, odds
```

---

## 💥 Common Pitfalls

- Python **does not use `{}` or `;` for blocks**
- Uses **indentation (4 spaces)** to define blocks
- Type errors are caught **at runtime**:

```python
print("hello" + 3)  # ❌ TypeError
```

---

## 🧠 Best Practices for Beginners

- Use `snake_case` for variable and function names
- Write **small, reusable functions**
- Add **docstrings** to describe what each function does

### Example of a docstring:

```python
def greet(name):
    """
    Returns a personalized greeting.

    Parameters:
        name (str): The name of the person to greet.

    Returns:
        str: A greeting string.
    """
    return f"Hello, {name}"
```

- Avoid **mutating lists or dictionaries inside functions** unless it's explicitly needed to prevent unintended side effects.

---
