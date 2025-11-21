# Campo Minado - Multi-Implementação

Coleção de implementações do clássico jogo Campo Minado em diferentes linguagens e tecnologias.

## Descrição

Este repositório contém três implementações completas do jogo Campo Minado, cada uma usando uma abordagem tecnológica diferente, demonstrando a versatilidade do desenvolvimento de jogos em diferentes plataformas e paradigmas.

## Implementações Disponíveis

### 1. 🖥️ C CLI (Terminal)
**Pasta:** `c-cli/`

Versão clássica para linha de comando, escrita em C puro.

- **Linguagem:** C
- **Interface:** Terminal/CLI
- **Dependências:** GCC
- **Plataformas:** Linux, macOS, WSL

```bash
make c-cli
```

[Ver documentação completa →](c-cli/README.md)

---

### 2. 🎨 C LCUI (Interface Gráfica) ⚠️ EXPERIMENTAL

**Pasta:** `c-lcui/`

⚠️ **STATUS:** Em desenvolvimento - apresenta problemas de estabilidade

Interface gráfica usando LCUI framework com suporte a CSS.

- **Linguagem:** C com LCUI
- **Interface:** GUI (desktop nativo)
- **Dependências:** XMake, Node.js, LCUI
- **Plataformas:** Windows, Linux, macOS
- **Status:** Experimental - Segmentation faults no ambiente atual

```bash
make c-lcui-install
make c-lcui-run  # ⚠️ Pode não funcionar
```

**Nota:** Esta implementação está em desenvolvimento. Recomenda-se usar C CLI ou C# Uno.

[Ver documentação completa →](c-lcui/README.md)

---

### 3. 🌐 C# Uno Platform (Multiplataforma)
**Pasta:** `csharp-uno/`

Aplicação multiplataforma usando C# e Uno Platform.

- **Linguagem:** C# com XAML
- **Interface:** GUI multiplataforma
- **Dependências:** .NET 9 SDK
- **Plataformas:** Web (WASM), Desktop, Android, iOS
- **Recursos:** XAML, Hot Reload, Design responsivo

```bash
make csharp-install
make csharp-run
```

[Ver documentação completa →](csharp-uno/README.md)

---

## Início Rápido

### Ver todas as opções

```bash
make help
```

### Ver status do ambiente

```bash
make status
```

### Listar implementações

```bash
make list
```

### Instalar todas as dependências

```bash
make install-all
```

### Compilar tudo

```bash
make build-all
```

### Limpar tudo

```bash
make clean-all
```

## Comandos por Implementação

### C CLI
```bash
make c-cli-build    # Compilar
make c-cli-run      # Executar
make c-cli-clean    # Limpar
make c-cli          # Compilar + Executar
```

### C LCUI
```bash
make c-lcui-install # Instalar dependências
make c-lcui-build   # Compilar
make c-lcui-run     # Executar
make c-lcui-clean   # Limpar
make c-lcui         # Build + Executar
```

### C# Uno
```bash
make csharp-install # Instalar workloads
make csharp-build   # Compilar
make csharp-run     # Executar
make csharp-clean   # Limpar
make csharp         # Build + Executar
```

## Requisitos por Implementação

| Implementação | Requisitos Principais |
|---------------|----------------------|
| **C CLI** | GCC |
| **C LCUI** | GCC, XMake, Node.js |
| **C# Uno** | .NET 9 SDK |

## Estrutura do Projeto

```
campo-minado/
├── c-cli/              # Implementação C CLI
│   ├── campominado.c
│   ├── Makefile
│   └── README.md
│
├── c-lcui/             # Implementação C LCUI
│   ├── app/
│   ├── xmake.lua
│   ├── Makefile
│   └── README.md
│
├── csharp-uno/         # Implementação C# Uno
│   ├── App.xaml
│   ├── MainPage.xaml
│   ├── MinesweeperUno.sln
│   ├── Makefile
│   └── README.md
│
├── Makefile            # Makefile principal
└── README.md           # Este arquivo
```

## Comparação das Implementações

| Característica | C CLI | C LCUI | C# Uno |
|----------------|-------|---------|---------|
| Interface | Terminal | GUI Nativa | GUI Multiplataforma |
| Complexidade | Baixa | Média | Média-Alta |
| Portabilidade | Alta (CLI) | Média (Desktop) | Muito Alta |
| Performance | Excelente | Excelente | Boa |
| Tamanho Final | Mínimo | Pequeno | Médio |
| Hot Reload | ❌ | ✅ | ✅ |
| Web | ❌ | ❌ | ✅ |
| Mobile | ❌ | ❌ | ✅ |
| Desktop | ✅ | ✅ | ✅ |

## Como Escolher?

- **Quer algo rápido e leve?** → C CLI
- **Quer interface gráfica nativa em C?** → C LCUI
- **Quer multiplataforma moderno?** → C# Uno
- **Quer aprender diferentes tecnologias?** → Todas! 🎓

## Desenvolvimento

Cada implementação tem seu próprio README com instruções detalhadas de desenvolvimento, arquitetura e recursos específicos.

## Recursos do Jogo

Todas as implementações incluem:
- ✅ Grid customizável de células
- ✅ Geração aleatória de minas
- ✅ Revelação de células
- ✅ Marcação de bandeiras
- ✅ Detecção de vitória/derrota
- ✅ Configurações de dificuldade

## Contribuindo

Sinta-se à vontade para:
- Reportar bugs
- Sugerir melhorias
- Adicionar novas implementações
- Melhorar a documentação

## Licenças

Cada implementação pode ter sua própria licença. Verifique o arquivo LICENSE em cada pasta.

## Links Úteis

- [LCUI Framework](https://lcui.lc-soft.io/)
- [Uno Platform](https://platform.uno/)
- [XMake](https://xmake.io/)
- [.NET](https://dotnet.microsoft.com/)

---

**Divirta-se jogando e explorando diferentes tecnologias!** 🎮
