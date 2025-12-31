# Campo Minado - Projeto de Graduação (UFV)

Este repositório contém o projeto desenvolvido durante o curso de **Sistemas de Informação** na **Universidade Federal de Viçosa (UFV)**. O objetivo foi explorar diferentes paradigmas de desenvolvimento e tecnologias através da implementação do clássico jogo **Campo Minado**.

## 🎓 Contexto Acadêmico

**Instituição:** Universidade Federal de Viçosa (UFV)
**Curso:** Sistemas de Informação
**Projeto:** Multi-implementação do jogo Campo Minado

O projeto demonstra a versatilidade no desenvolvimento de software, abordando desde aplicações de baixo nível em terminal até interfaces gráficas modernas e multiplataforma.

---

## 📂 Estrutura do Projeto

O projeto está organizado em três implementações principais, cada uma explorando tecnologias distintas:

```text
.
├── Makefile            # Automação principal para gerenciar todos os projetos
├── c-cli/              # Implementação 1: Terminal (C Puro)
│   ├── campominado.c   # Código fonte único
│   ├── Makefile
│   └── README.md
├── c-lcui/             # Implementação 2: Desktop GUI (C + LCUI)
│   ├── app/            # Código da aplicação
│   ├── xmake.lua       # Configuração de build
│   └── Makefile
└── csharp-uno/         # Implementação 3: Multiplataforma (C# + Uno Platform)
    ├── MinesweeperGame.cs
    ├── MainPage.xaml
    ├── MinesweeperUno.sln
    └── Makefile
```

---

## 🛠️ Implementações

### 1. 🖥️ C CLI (Terminal)
**Foco:** Lógica pura e manipulação de memória em C.
- **Tecnologia:** C (Standard Library)
- **Interface:** Linha de Comando (CLI)
- **Características:** Leve, rápido e portátil em sistemas Unix-like.

### 2. 🎨 C LCUI (Interface Gráfica)
**Foco:** Desenvolvimento desktop nativo em C com interface moderna.
- **Tecnologia:** C, LCUI (GUI Framework), CSS
- **Interface:** Janela Desktop
- **Status:** Experimental (em desenvolvimento)

### 3. 🌐 C# Uno Platform (Multiplataforma)
**Foco:** Desenvolvimento moderno orientado a objetos e cross-platform.
- **Tecnologia:** C# .NET 9, Uno Platform, XAML
- **Interface:** Web (WASM), Desktop, Mobile
- **Características:** Interface rica e responsiva.

---

## 🚀 Como Executar

O projeto possui um `Makefile` na raiz que facilita a execução de qualquer versão.

### Comandos Principais

```bash
# Listar todas as opções disponíveis
make help

# Verificar status das dependências
make status
```

### Executando cada versão

#### Versão C CLI (Terminal)
```bash
make c-cli          # Compila e executa
```

#### Versão C LCUI (Experimental)
```bash
make c-lcui-install # Instala dependências
make c-lcui         # Compila e executa
```

#### Versão C# Uno
```bash
make csharp-install # Instala workloads do .NET
make csharp         # Compila e executa
```

---

## 🧩 Detalhes Técnicos

### Requisitos Gerais
- **Make:** Para orquestração dos comandos.
- **GCC:** Para as versões em C.
- **.NET SDK:** Para a versão em C#.

### Comparativo

| Característica | C CLI | C LCUI | C# Uno |
|----------------|-------|---------|---------|
| **Nível** | Baixo Nível | Médio Nível | Alto Nível |
| **Interface** | Texto | Gráfica (C) | Gráfica (XAML) |
| **Paradigma** | Estrutural | Estrutural/Eventos | Orientado a Objetos |
| **Plataforma** | Linux/Mac/WSL | Desktop | Web/Mobile/Desktop |

---

## 📄 Licença

Este projeto foi desenvolvido para fins acadêmicos. Consulte os arquivos de licença em cada subdiretório para detalhes específicos.
