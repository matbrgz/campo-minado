#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int menu(int *config_x, int *config_y, int *config_bombas);
void menu_config(int *config_x, int *config_y, int *config_bombas);

void gera_bomba(char tabuleiro_auxiliar[9 + 2][9 + 2], int bombas, int x_init, int y_init)
{
    srand(time(NULL));
    //srand(1);
    int x_rand, y_rand;
    for (int i = 0; i < bombas; i++)
    {
        x_rand = 1 + (rand() % x_init);
        y_rand = 1 + (rand() % y_init);
        if (tabuleiro_auxiliar[x_rand][y_rand] != '*')
        {
            tabuleiro_auxiliar[x_rand][y_rand] = '*';
        }
        // trata as colisões de bombas
        else
        {
            gera_bomba(tabuleiro_auxiliar, 1, x_init, y_init);
        }
    }
}

void adjacente(char tabuleiro_auxiliar[9 + 2][9 + 2], int x_init, int y_init)
{
    char count;
    for (int i = 1; i < y_init + 1; i++)
    {
        for (int j = 1; j < x_init + 1; j++)
        {
            count = '0';
            if (tabuleiro_auxiliar[i][j] != '*')
            {
                if (tabuleiro_auxiliar[i - 1][j - 1] == '*')
                {
                    count++;
                }
                if (tabuleiro_auxiliar[i - 1][j] == '*')
                {
                    count++;
                }
                if (tabuleiro_auxiliar[i - 1][j + 1] == '*')
                {
                    count++;
                }
                if (tabuleiro_auxiliar[i][j - 1] == '*')
                {
                    count++;
                }
                if (tabuleiro_auxiliar[i][j + 1] == '*')
                {
                    count++;
                }
                if (tabuleiro_auxiliar[i + 1][j - 1] == '*')
                {
                    count++;
                }
                if (tabuleiro_auxiliar[i + 1][j] == '*')
                {
                    count++;
                }
                if (tabuleiro_auxiliar[i + 1][j + 1] == '*')
                {
                    count++;
                }
                tabuleiro_auxiliar[i][j] = count;
            }
        }
    }
}

void transporta(int x, int y, char tabuleiro[9 + 2][9 + 2], char tabuleiro_auxiliar[9 + 2][9 + 2], int x_init, int y_init)
{
    if (tabuleiro_auxiliar[x - 1][y] != '*')
    {
        tabuleiro[x - 1][y] = tabuleiro_auxiliar[x - 1][y];
    }
    if (tabuleiro_auxiliar[x][y - 1] != '*')
    {
        tabuleiro[x][y - 1] = tabuleiro_auxiliar[x][y - 1];
    }
    if (tabuleiro_auxiliar[x][y + 1] != '*')
    {
        tabuleiro[x][y + 1] = tabuleiro_auxiliar[x][y + 1];
    }
    if (tabuleiro_auxiliar[x + 1][y] != '*')
    {
        tabuleiro[x + 1][y] = tabuleiro_auxiliar[x + 1][y];
    }
    if (tabuleiro_auxiliar[x - 1][y - 1] != '0' && tabuleiro_auxiliar[x - 1][y - 1] != '*')
    {
        tabuleiro[x - 1][y - 1] = tabuleiro_auxiliar[x - 1][y - 1];
    }
    if (tabuleiro_auxiliar[x - 1][y + 1] != '0' && tabuleiro_auxiliar[x - 1][y + 1] != '*')
    {
        tabuleiro[x - 1][y + 1] = tabuleiro_auxiliar[x - 1][y + 1];
    }
    if (tabuleiro_auxiliar[x + 1][y - 1] != '0' && tabuleiro_auxiliar[x + 1][y - 1] != '*')
    {
        tabuleiro[x + 1][y - 1] = tabuleiro_auxiliar[x + 1][y - 1];
    }
    if (tabuleiro_auxiliar[x + 1][y + 1] != '0' && tabuleiro_auxiliar[x + 1][y + 1] != '*')
    {
        tabuleiro[x + 1][y + 1] = tabuleiro_auxiliar[x + 1][y + 1];
    }
}

void expandir(int x, int y, char tabuleiro[9 + 2][9 + 2], char tabuleiro_auxiliar[9 + 2][9 + 2], int x_init, int y_init)
{
    if (x < 1 || x > x_init || y < 1 || y > y_init) return;

    if (tabuleiro_auxiliar[x][y] == '0')
    {
        tabuleiro_auxiliar[x][y] = '+';
        tabuleiro[x][y] = '-';
    }
    else
    {
        tabuleiro[x][y] = tabuleiro_auxiliar[x][y];
        return;
    }
    if (tabuleiro_auxiliar[x - 1][y] == '0')
    {
        expandir(x - 1, y, tabuleiro, tabuleiro_auxiliar, x_init, y_init);
    }
    if (tabuleiro_auxiliar[x][y - 1] == '0')
    {
        expandir(x, y - 1, tabuleiro, tabuleiro_auxiliar, x_init, y_init);
    }
    if (tabuleiro_auxiliar[x][y + 1] == '0')
    {
        expandir(x, y + 1, tabuleiro, tabuleiro_auxiliar, x_init, y_init);
    }
    if (tabuleiro_auxiliar[x + 1][y] == '0')
    {
        expandir(x + 1, y, tabuleiro, tabuleiro_auxiliar, x_init, y_init);
    }
    transporta(x, y, tabuleiro, tabuleiro_auxiliar, x_init, y_init);
}

void inserir(int *x, int *y, int tipo, int x_init, int y_init)
{
    do
    {
        if (tipo == 1)
        {
            printf("Insira a linha que deseja colocar a bandeira: ");
            scanf("%d", x);
            printf("Insira a coluna que deseja colocar a bandeira: ");
            scanf("%d", y);
        }
        else
        {
            printf("Insira a linha da jogada: ");
            scanf("%d", x);
            printf("Insira a coluna da jogada: ");
            scanf("%d", y);
        }
        if (*x >= 1 && *x <= x_init && *y >= 1 && *y <= y_init)
        {
            break;
        }
        printf("Jogada invalida\n");
    } while (1);
}

void preenche_tabuleiro(char tabuleiro[9 + 2][9 + 2], char tabuleiro_auxiliar[9 + 2][9 + 2], int x_init, int y_init, int bombas)
{
    for (int i = 0; i < y_init + 2; i++)
    {
        for (int j = 0; j < x_init + 2; j++)
        {
            tabuleiro[i][j] = '#';
            tabuleiro_auxiliar[i][j] = '#';
        }
    }
    gera_bomba(tabuleiro_auxiliar, bombas, x_init, y_init);
    adjacente(tabuleiro_auxiliar, x_init, y_init);
    for (int i = 0; i < y_init + 2; i++)
    {
        for (int j = 0; j < x_init + 2; j++)
        {
            if (i == 0 || i == y_init + 1 || j == 0 || j == x_init + 1)
            {
                tabuleiro[i][j] = '@';
                tabuleiro_auxiliar[i][j] = '@';
            }
        }
    }
}

void printa_tabuleiro(char tabuleiro[9 + 2][9 + 2], int x_init, int y_init)
{
    printf("\t");
    for (int y = 0; y < y_init + 2; y++)
    {
        if (y != 0 && y != y_init + 1)
        {
            printf("%d ", y);
        }
        else
        {
            printf("  ");
        }
    }
    printf("\n\n");
    for (int x = 0; x < x_init + 2; x++)
    {
        if (x != 0 && x != x_init + 1)
        {
            printf("%d ", x);
        }
        else
        {
            printf("  ");
        }
        printf("\t");
        for (int y = 0; y < y_init + 2; y++)
        {
            printf("%c ", tabuleiro[x][y]);
        }
        printf("\n");
    }
    printf("\n");
}

void jogo(int x_init, int y_init, int bombas)
{
    char tabuleiro[9 + 2][9 + 2], tabuleiro_auxiliar[9 + 2][9 + 2];
    int ganhou = 0;
    int celulas_abertas = 0;
    int celulas_nao_bomba = (x_init * y_init) - bombas;

    system("cls || clear");
    preenche_tabuleiro(tabuleiro, tabuleiro_auxiliar, x_init, y_init, bombas);

    while (ganhou != 1)
    {
        system("cls || clear");
        printf("----------------------------------------------\n");
        printf("\t\t CAMPO MINADO\n");
        printf("----------------------------------------------\n");
        printa_tabuleiro(tabuleiro, x_init, y_init);
        printf("\n");
        printa_tabuleiro(tabuleiro_auxiliar, x_init, y_init);
        int opcao, x, y;
        printf("Bandeira(-1) ou Abrir(1): ");
        scanf("%d", &opcao);
        if (opcao == -1)
        {
            inserir(&x, &y, 1, x_init, y_init);
            if (tabuleiro[x][y] == '-' || tabuleiro[x][y] == '1' || tabuleiro[x][y] == '2' || tabuleiro[x][y] == '4')
            {
                printf("Voce nao pode colocar uma bandeira na posicao ja aberta\n");
            }
            else
            {
                tabuleiro[x][y] = 'B';
            }
        }
        else
        {
            inserir(&x, &y, 0, x_init, y_init);
            if (tabuleiro[x][y] == 'B')
            {
                printf("Voce nao pode abrir uma bandeira\n");
            }
            else if (tabuleiro_auxiliar[x][y] == '*')
            {
                printf("Voce perdeu\n");
                exit(1);
            }
            else
            {
                expandir(x, y, tabuleiro, tabuleiro_auxiliar, x_init, y_init);
            }
        }

        celulas_abertas = 0;
        for (int i = 1; i <= y_init; i++)
        {
            for (int j = 1; j <= x_init; j++)
            {
                if (tabuleiro[i][j] != '#' && tabuleiro[i][j] != 'B')
                {
                    celulas_abertas++;
                }
            }
        }

        if (celulas_abertas == celulas_nao_bomba)
        {
            printf("Parabens! Voce venceu!\n");
            ganhou = 1;
        }
    }
}



void menu_config(int *config_x, int *config_y, int *config_bombas)
{
    int menu_opcao;
    do
    {
        system("cls || clear");
        printf("O que deseja:\nDefinir o numero de linhas - digite 1\nDefinir o numero de colunas - digite 2\nDefinir o numero de bombas - digite 3\nVoltar ao menu inicial - digite 4\n");
        scanf("%d", &menu_opcao);
        switch (menu_opcao)
        {
        case 1:
            printf("Digite o numero de linhas (max 9)\n");
            scanf("%d", config_x);
            if (*config_x > 9)
            {
                printf("Numero de linhas excede o maximo. Setado para 9.\n");
                *config_x = 9;
            }
            break;
        case 2:
            printf("Digite o numero de colunas (max 9)\n");
            scanf("%d", config_y);
            if (*config_y > 9)
            {
                printf("Numero de colunas excede o maximo. Setado para 9.\n");
                *config_y = 9;
            }
            break;
        case 3:
            printf("Digite o numero de bombas\n");
            scanf("%d", config_bombas);
            break;
        case 4:
            break;
        default:
            printf("Por favor digite uma opcao valida!\n");
            break;
        }
    } while (menu_opcao != 4);
}

int menu(int *config_x, int *config_y, int *config_bombas)
{
    int menu_opcao;
    //system("cls || clear");
    printf("----------------------------------------------\n");
    printf("\t\t CAMPO MINADO\n");
    printf("----------------------------------------------\n");
    printf("\nMENU\nO que deseja:\nNovo Jogo - digite 1\nConfiguracao - digite 2\nSair - digite 3\n");
    scanf("%d", &menu_opcao);
    switch (menu_opcao)
    {
    case 1:
        return 1;
        break;
    case 2:
        menu_config(config_x, config_y, config_bombas);
        menu(config_x, config_y, config_bombas);
        break;
    case 3:
        printf("Fechando\n");
        exit(1);
        break;
    default:
        printf("Por favor digite uma opcao valida!\n");
        break;
    }
    return 0;
}

int main()
{
    int config_x = 9, config_y = 9, config_bombas = 10;
    int controle;
    controle = menu(&config_x, &config_y, &config_bombas);
    if (controle == 1)
    {
        jogo(config_x, config_y, config_bombas);
    }
    else
    {
        printf("Falha catastrofica!\n");
        exit(1);
    }

    return 0;
}