using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Navigation;

namespace MinesweeperUno
{
    public sealed partial class MainPage : Page
    {
        private int _boardWidth;
        private int _boardHeight;
        private int _numberOfBombs;

        private MinesweeperGame? _game;
        private Button[,]? _buttons;

        public MainPage()
        {
            this.InitializeComponent();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);
            if (e.Parameter is GameConfig config)
            {
                _boardWidth = config.Width;
                _boardHeight = config.Height;
                _numberOfBombs = config.Bombs;
                StartNewGame();
            }
        }

        private void StartNewGame()
        {
            _game = new MinesweeperGame(_boardWidth, _boardHeight, _numberOfBombs);
            _buttons = new Button[_boardWidth, _boardHeight];
            GameBoard.Children.Clear();
            GameBoard.RowDefinitions.Clear();
            GameBoard.ColumnDefinitions.Clear();

            for (var i = 0; i < _boardHeight; i++)
            {
                GameBoard.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Star) });
            }
            for (var i = 0; i < _boardWidth; i++)
            {
                GameBoard.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(1, GridUnitType.Star) });
            }

            for (var x = 0; x < _boardWidth; x++)
            {
                for (var y = 0; y < _boardHeight; y++)
                {
                    var button = new Button
                    {
                        Content = "❓",
                        FontSize = 24,
                        FontFamily = new Microsoft.UI.Xaml.Media.FontFamily("ms-appx:///Assets/Fonts/NotoColorEmoji.ttf#Noto Color Emoji"),
                        HorizontalAlignment = HorizontalAlignment.Stretch,
                        VerticalAlignment = VerticalAlignment.Stretch
                    };
                    button.Click += Cell_Click;
                    button.PointerPressed += Cell_RightClick;
                    Grid.SetColumn(button, x);
                    Grid.SetRow(button, y);
                    GameBoard.Children.Add(button);
                    _buttons[x, y] = button;
                }
            }

            StatusTextBlock.Text = "Good luck!";
        }

        private void Cell_Click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;
            var x = Grid.GetColumn(button);
            var y = Grid.GetRow(button);

            _game!.RevealCell(x, y);
            UpdateBoard();
        }

        private void Cell_RightClick(object sender, PointerRoutedEventArgs e)
        {
            if (e.GetCurrentPoint(sender as UIElement).Properties.IsRightButtonPressed)
            {
                var button = (Button)sender;
                var x = Grid.GetColumn(button);
                var y = Grid.GetRow(button);

                _game!.ToggleFlag(x, y);
                UpdateBoard();
            }
        }

        private void UpdateBoard()
        {
            for (var x = 0; x < _boardWidth; x++)
            {
                for (var y = 0; y < _boardHeight; y++)
                {
                    var cell = _game!.Board![x, y];
                    var button = _buttons![x, y];

                    if (cell.IsRevealed)
                    {
                        if (cell.IsBomb)
                        {
                            button.Content = "💣";
                        }
                        else
                        {
                            button.Content = cell.AdjacentBombs > 0 ? GetNumberEmoji(cell.AdjacentBombs) : "⬜️";
                        }
                    }
                    else if (cell.IsFlagged)
                    {
                        button.Content = "🚩";
                    }
                    else
                    {
                        button.Content = "❓";
                    }
                }
            }

            if (_game!.IsGameOver)
            {
                StatusTextBlock.Text = _game.IsGameWon ? "You win!" : "You lose!";
            }
        }
        
        private void NewGameButton_Click(object sender, RoutedEventArgs e)
        {
            this.Frame.Navigate(typeof(ConfigPage));
        }

        private string GetNumberEmoji(int number)
        {
            return number switch
            {
                1 => "1️⃣",
                2 => "2️⃣",
                3 => "3️⃣",
                4 => "4️⃣",
                5 => "5️⃣",
                6 => "6️⃣",
                7 => "7️⃣",
                8 => "8️⃣",
                _ => ""
            };
        }
    }
}

