# Campo Minado (Minesweeper)

This is a simple command-line implementation of the classic game Minesweeper, written in C.

## Features

-   **Mine Generation**: Random placement of mines on the board.
-   **Adjacent Mine Count**: Calculates and displays the number of adjacent mines for each cell.
-   **Board Expansion**: Automatically reveals adjacent empty cells and their numbered neighbors when an empty cell is selected.
-   **Flagging**: Allows players to flag cells they suspect contain mines.
-   **Basic UI**: Command-line interface for interaction.

## How to Play

1.  **Start a New Game**: Select option `1` from the main menu.
2.  **Make a Move**:
    *   To **open a cell**, enter `1` when prompted, then provide the row and column numbers.
    *   To **place/remove a flag**, enter `-1` when prompted, then provide the row and column numbers.
3.  **Objective**: Uncover all non-mine cells without detonating any mines.

## How to Compile and Run

To compile and run this game, you will need a C compiler (like GCC).

1.  **Compile the source code**:
    ```bash
    gcc campominado.c -o campominado
    ```
2.  **Run the executable**:
    ```bash
    ./campominado
    ```

## Project Structure

-   `campominado.c`: The main source code file containing all game logic.
-   `README.md`: This file.
-   `LICENSE`: The project's license (MIT License).
-   `.gitignore`: Specifies intentionally untracked files to ignore.
-   `.gitattributes`: Defines attributes for pathnames.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.