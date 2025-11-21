using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;

namespace MinesweeperUno
{
    public sealed partial class ConfigPage : Page
    {
        public ConfigPage()
        {
            this.InitializeComponent();
        }

        private void StartGameButton_Click(object sender, RoutedEventArgs e)
        {
            var width = (int)WidthSlider.Value;
            var height = (int)HeightSlider.Value;
            var bombs = (int)BombsSlider.Value;

            // Here we need to find the frame and navigate.
            // Since this is a simple app, we can assume the root is a Frame.
            this.Frame.Navigate(typeof(MainPage), new GameConfig(width, height, bombs));
        }
    }

    public class GameConfig
    {
        public int Width { get; }
        public int Height { get; }
        public int Bombs { get; }

        public GameConfig(int width, int height, int bombs)
        {
            Width = width;
            Height = height;
            Bombs = bombs;
        }
    }
}
