import tkinter as tk
from tkinter import filedialog
from tkinter import ttk
import sys
import re
import subprocess
import os
import shutil

def on_configure(event, canvas):
    canvas.configure(scrollregion=canvas.bbox("all"))

def create_checkboxes_from_files(file_path1, file_path2):
    if not file_path1:
        return

    root.withdraw()  # Hide the main window

    filename1 = os.path.basename(file_path1)

    # Create a temporary copy of file_path1
    temp_file_path1 = f"{file_path1}.tmp"
    shutil.copyfile(file_path1, temp_file_path1)

    checkboxes_window = tk.Tk()  # Use tk.Tk() instead of tk.Toplevel()
    checkboxes_window.title(filename1)  # Set the window title as the filename of file_path1
    checkboxes_window.geometry("800x600")  # Set the size of the checkbox window

    canvas_frame = tk.Frame(checkboxes_window)
    canvas_frame.pack(side=tk.TOP, fill=tk.BOTH, expand=True)

    canvas = tk.Canvas(canvas_frame)
    canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

    scrollbar = tk.Scrollbar(canvas_frame, command=canvas.yview)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

    canvas.configure(yscrollcommand=scrollbar.set)
    canvas.bind('<Configure>', lambda event, canvas=canvas: on_configure(event, canvas))

    frame = tk.Frame(canvas)
    canvas.create_window((0, 0), window=frame, anchor='nw')

    ignore_prefixes = ["PSRJ", "PEPOCH", "POSEPOCH", "DMEPOCH", "CLK", "MODE 1", "UNITS", "TCB", "TIMEEPH", "T2CMETHOD", "CORRECT_TROPOSPHERE", "EPHEM"]
    ignore_regex = r'DMXR\d+_\d+|DMXF\d+_\d+|DMXEP_\d+'

    def process_file(file_path):
        with open(file_path, "r") as file:
            return [line.strip().split()[0] for line in file if not any(line.startswith(prefix) for prefix in ignore_prefixes) and not re.match(ignore_regex, line.strip().split()[0])]

    entries1 = process_file(file_path1)

    def update_temp_file(entry, checked):
        nonlocal temp_file_path1
        with open(temp_file_path1, "r") as file:
            lines = file.readlines()
        with open(temp_file_path1, "w") as file:
            for line in lines:
                parts = line.strip().split()
                if len(parts) >= 3 and parts[0] == entry:
                    if entry in ["RAJ", "DECJ"]:
                        if not checked:
                            if len(parts) < 3 or parts[2] in ['1','0']:
                                parts[2] = '1'
                            else:
                                parts[2] = f'1 {parts[2]}'
                        else:
                            if len(parts) < 3 or parts[2] in ['1', '0']:
                                parts[2] = '0'
                            else:
                                parts[2] = f'0 {parts[2]}'

                    line = '\t'.join(parts) + '\n'
                file.write(line)

    row = 0
    column = 1
    for i, entry in enumerate(entries1):
        if row == 40:  # Stop creating checkboxes after 40 rows
            break
        if column == 6:
            column = 1
            row += 1
        checkbox_var = tk.BooleanVar()
        checkbox = ttk.Checkbutton(frame, text=entry, variable=checkbox_var, command=lambda var=checkbox_var, entry=entry: update_temp_file(entry, var.get()))
        checkbox.grid(row=row, column=column, padx=5, pady=5)
        column += 1

    run_tempo2_button = tk.Button(frame, text="Run tempo2", command=lambda: run_tempo2(temp_file_path1, file_path2))
    run_tempo2_button.grid(row=6, column=0, padx=5, pady=5)  # Renamed button to "Run tempo2"

    save_button = tk.Button(frame, text="Save file", command=lambda: save_temp_file_as_par_fit_par(temp_file_path1, file_path1))
    save_button.grid(row=9, column=0, padx=5, pady=5)

    def quit_function():
        nonlocal temp_file_path1
        if os.path.exists(temp_file_path1):
            os.remove(temp_file_path1)  # Delete the temporary file if it exists
        checkboxes_window.destroy()
        print("Keep Going InPTA")
        sys.exit()

    quit_button = tk.Button(frame, text="Quit", command=quit_function)  # Assign quit function to the Quit button
    quit_button.grid(row=15, column=0, padx=5, pady=5)  # Position the Quit button in column 0, row 15

    canvas.update_idletasks()  # Update canvas to get correct bbox
    canvas.configure(scrollregion=canvas.bbox("all"))  # Set scroll region again

def run_tempo2(temp_file_path1, file_path2):
    command = f"tempo2 -us -gr plk -f {temp_file_path1} {file_path2}"
    subprocess.run(command, shell=True)

def save_temp_file_as_par_fit_par(temp_file_path1, file_path1):
    base_name, _ = os.path.splitext(file_path1)
    new_file_path = f"{base_name}.fit.par"
    shutil.copyfile(temp_file_path1, new_file_path)

def main():
    global root
    root = tk.Tk()
    root.title("Text File Checkbox Creator")
    root.geometry("800x600")  # Set the size of the main window

    if len(sys.argv) != 3:
        print("Usage: python script.py <text_file_path_1> <text_file_path_2>")
        return

    file_path1 = sys.argv[1]
    file_path2 = sys.argv[2]

    create_checkboxes_from_files(file_path1, file_path2)

    root.mainloop()

if __name__ == "__main__":
    main()

