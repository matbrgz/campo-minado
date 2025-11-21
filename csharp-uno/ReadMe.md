# Campo Minado - C# com Uno Platform

Implementação multiplataforma do jogo Campo Minado usando C# e Uno Platform.

## Descrição

Esta versão utiliza o Uno Platform, um framework que permite criar aplicações com uma única base de código C#/XAML que roda em:
- Web (WebAssembly)
- Desktop (Windows, Linux, macOS)
- Mobile (Android, iOS)
- E muito mais!

## Requisitos

- [.NET 9 SDK](https://dotnet.microsoft.com/download) ou superior
- Visual Studio 2022, VS Code ou Rider (opcional)
- Workloads do .NET para Uno Platform

## Como Usar

### Instalar workloads do .NET

```bash
make install
```

### Restaurar dependências

```bash
make restore
```

### Compilar (WebAssembly)

```bash
make build
```

### Executar no navegador

```bash
make run
```

### Compilar e executar Desktop

```bash
make build-desktop
make run-desktop
```

### Publicar para produção

```bash
# WebAssembly
make publish-wasm

# Desktop
make publish-desktop
```

### Limpar arquivos compilados

```bash
make clean
```

### Executar testes

```bash
make test
```

### Ver ajuda

```bash
make help
```

## Estrutura do Projeto

```
csharp-uno/
├── App.xaml              # Configuração da aplicação
├── MainPage.xaml         # Página principal do jogo
├── ConfigPage.xaml       # Página de configuração
├── MinesweeperGame.cs    # Lógica do jogo
├── Assets/               # Recursos (ícones, fontes)
├── Platforms/            # Código específico por plataforma
│   ├── Android/
│   ├── iOS/
│   ├── Desktop/
│   └── WebAssembly/
└── MinesweeperUno.csproj # Arquivo do projeto
```

## Plataformas Suportadas

- ✅ WebAssembly (navegador)
- ✅ Desktop (Windows/Linux/macOS)
- ✅ Android
- ✅ iOS

## Tecnologias

- **C#** - Linguagem de programação
- **XAML** - Interface de usuário
- **Uno Platform** - Framework multiplataforma
- **.NET 9** - Runtime e SDK

## Recursos

- Interface moderna e responsiva
- Configurações personalizáveis de dificuldade
- Funciona em múltiplas plataformas
- Baseado em XAML para UI declarativa

## Documentação

Para mais informações sobre o Uno Platform:
- [Getting Started](https://aka.platform.uno/get-started)
- [Uno.Sdk Documentation](https://aka.platform.uno/using-uno-sdk)

## Licença

Veja o arquivo de licença para mais detalhes.