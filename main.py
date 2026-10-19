import tkinter as tk

# Create the main window
root = tk.Tk()
root.title("Calculator")
root.geometry("300x400")

# Entry widget
entry = tk.Entry(root, font=("Arial", 20), justify="right", bd=10)
entry.grid(row=0, column=0, columnspan=4, pady=10)

# Button click function
def click(value):
    entry.insert(tk.END, value)

# Clear screen
def clear():
    entry.delete(0, tk.END)

# Calculate result
def calculate():
    try:
        result = eval(entry.get())
        entry.delete(0, tk.END)
        entry.insert(0, result)
    except:
        entry.delete(0, tk.END)
        entry.insert(0, "Error")

# Button layout
buttons = [
    "7", "8", "9", "/",
    "4", "5", "6", "*",
    "1", "2", "3", "-",
    "0", ".", "=", "+"
]

row = 1
col = 0

for button in buttons:
    if button == "=":
        cmd = calculate
    else:
        cmd = lambda x=button: click(x)

    tk.Button(
        root,
        text=button,
        width=5,
        height=2,
        font=("Arial", 18),
        command=cmd
    ).grid(row=row, column=col, padx=5, pady=5)

    col += 1
    if col > 3:
        col = 0
        row += 1

# Clear button
tk.Button(
    root,
    text="C",
    width=22,
    height=2,
    font=("Arial", 18),
    command=clear
).grid(row=5, column=0, columnspan=4, pady=10)

root.mainloop()