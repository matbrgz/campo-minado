namespace MinesweeperUno;

public class Cell
{
    public bool IsBomb { get; set; }
    public bool IsRevealed { get; set; }
    public bool IsFlagged { get; set; }
    public int AdjacentBombs { get; set; }
}

public class MinesweeperGame
{
    public Cell[,]? Board { get; private set; }
    public int Width { get; }
    public int Height { get; }
    public int NumberOfBombs { get; }
    public bool IsGameOver { get; private set; }
    public bool IsGameWon { get; private set; }

    public MinesweeperGame(int width, int height, int numberOfBombs)
    {
        Width = width;
        Height = height;
        NumberOfBombs = numberOfBombs;
        InitializeBoard();
    }

    private void InitializeBoard()
    {
        Board = new Cell[Width, Height];
        for (var x = 0; x < Width; x++)
        {
            for (var y = 0; y < Height; y++)
            {
                Board[x, y] = new Cell();
            }
        }

        PlaceBombs();
        CalculateAdjacentBombs();
    }

    private void PlaceBombs()
    {
        var random = new Random();
        var bombsPlaced = 0;
        while (bombsPlaced < NumberOfBombs)
        {
            var x = random.Next(Width);
            var y = random.Next(Height);
            if (!Board![x, y].IsBomb)
            {
                Board[x, y].IsBomb = true;
                bombsPlaced++;
            }
        }
    }

    private void CalculateAdjacentBombs()
    {
        for (var x = 0; x < Width; x++)
        {
            for (var y = 0; y < Height; y++)
            {
                if (Board![x, y].IsBomb) continue;
                var adjacentBombs = 0;
                for (var dx = -1; dx <= 1; dx++)
                {
                    for (var dy = -1; dy <= 1; dy++)
                    {
                        if (dx == 0 && dy == 0) continue;
                        var newX = x + dx;
                        var newY = y + dy;
                        if (newX >= 0 && newX < Width && newY >= 0 && newY < Height && Board[newX, newY].IsBomb)
                        {
                            adjacentBombs++;
                        }
                    }
                }
                Board[x, y].AdjacentBombs = adjacentBombs;
            }
        }
    }

    public void RevealCell(int x, int y)
    {
        if (IsGameOver || Board![x, y].IsRevealed || Board[x, y].IsFlagged) return;

        Board[x, y].IsRevealed = true;

        if (Board[x, y].IsBomb)
        {
            IsGameOver = true;
            return;
        }

        if (Board[x, y].AdjacentBombs == 0)
        {
            for (var dx = -1; dx <= 1; dx++)
            {
                for (var dy = -1; dy <= 1; dy++)
                {
                    if (dx == 0 && dy == 0) continue;
                    var newX = x + dx;
                    var newY = y + dy;
                    if (newX >= 0 && newX < Width && newY >= 0 && newY < Height)
                    {
                        RevealCell(newX, newY);
                    }
                }
            }
        }
        CheckForWin();
    }

    public void ToggleFlag(int x, int y)
    {
        if (IsGameOver || Board![x, y].IsRevealed) return;
        Board[x, y].IsFlagged = !Board[x, y].IsFlagged;
    }

    private void CheckForWin()
    {
        var revealedCells = 0;
        for (var x = 0; x < Width; x++)
        {
            for (var y = 0; y < Height; y++)
            {
                if (Board![x, y].IsRevealed)
                {
                    revealedCells++;
                }
            }
        }

        if (revealedCells == Width * Height - NumberOfBombs)
        {
            IsGameWon = true;
            IsGameOver = true;
        }
    }
}