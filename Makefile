# Makefile Principal - Campo Minado Multi-Implementação
# Gerencia todas as versões do jogo

.PHONY: all help list install clean status
.PHONY: c-cli c-cli-build c-cli-run c-cli-clean
.PHONY: c-lcui c-lcui-install c-lcui-install-fonts c-lcui-build c-lcui-run c-lcui-run-quiet c-lcui-run-clean c-lcui-clean
.PHONY: csharp csharp-install csharp-build csharp-run csharp-clean
.PHONY: install-all build-all clean-all

# Cores para output
BOLD := \033[1m
RESET := \033[0m
GREEN := \033[32m
BLUE := \033[34m
YELLOW := \033[33m

all: help

help:
	@echo "$(BOLD)════════════════════════════════════════════════════════════$(RESET)"
	@echo "$(BOLD)        Campo Minado - Multi-Implementação                 $(RESET)"
	@echo "$(BOLD)════════════════════════════════════════════════════════════$(RESET)"
	@echo ""
	@echo "$(GREEN)Comandos Gerais:$(RESET)"
	@echo "  make help          - Mostra esta ajuda"
	@echo "  make list          - Lista todas as implementações"
	@echo "  make status        - Mostra status de cada projeto"
	@echo "  make install-all   - Instala dependências de todos os projetos"
	@echo "  make build-all     - Compila todos os projetos"
	@echo "  make clean-all     - Limpa todos os projetos"
	@echo ""
	@echo "$(BLUE)C CLI (Terminal):$(RESET)"
	@echo "  make c-cli         - Compila e executa versão CLI"
	@echo "  make c-cli-build   - Apenas compila"
	@echo "  make c-cli-run     - Apenas executa"
	@echo "  make c-cli-clean   - Limpa arquivos compilados"
	@echo ""
	@echo "$(BLUE)C LCUI (Interface Gráfica):$(RESET)"
	@echo "  make c-lcui-install       - Instala dependências LCUI"
	@echo "  make c-lcui-install-fonts - Instala fontes (elimina erros)"
	@echo "  make c-lcui-build         - Compila projeto LCUI"
	@echo "  make c-lcui-run-clean     - Executa (limpo - RECOMENDADO)"
	@echo "  make c-lcui-run-quiet     - Executa (silencioso)"
	@echo "  make c-lcui-run           - Executa (verbose - debug)"
	@echo "  make c-lcui-clean         - Limpa projeto LCUI"
	@echo ""
	@echo "$(BLUE)C# Uno Platform (Multiplataforma):$(RESET)"
	@echo "  make csharp-install - Instala workloads .NET"
	@echo "  make csharp-build   - Compila projeto C#"
	@echo "  make csharp-run     - Executa no navegador (WASM)"
	@echo "  make csharp-clean   - Limpa projeto C#"
	@echo ""
	@echo "$(YELLOW)Exemplos:$(RESET)"
	@echo "  make c-cli         # Roda versão CLI rapidamente"
	@echo "  make build-all     # Compila tudo"
	@echo "  make status        # Vê o que está instalado"
	@echo ""

list:
	@echo "$(BOLD)Implementações Disponíveis:$(RESET)"
	@echo ""
	@echo "$(GREEN)1. C CLI (c-cli/)$(RESET)"
	@echo "   - Versão clássica para terminal"
	@echo "   - Linguagem: C puro"
	@echo "   - Dependências: GCC"
	@echo ""
	@echo "$(GREEN)2. C LCUI (c-lcui/)$(RESET)"
	@echo "   - Interface gráfica moderna"
	@echo "   - Linguagem: C com LCUI framework"
	@echo "   - Dependências: Node.js, XMake, LCUI"
	@echo ""
	@echo "$(GREEN)3. C# Uno Platform (csharp-uno/)$(RESET)"
	@echo "   - Multiplataforma (Web, Desktop, Mobile)"
	@echo "   - Linguagem: C# com XAML"
	@echo "   - Dependências: .NET 9 SDK"
	@echo ""

status:
	@echo "$(BOLD)Status das Implementações:$(RESET)"
	@echo ""
	@echo -n "$(BLUE)C CLI:$(RESET)        "
	@if [ -f c-cli/campominado ]; then \
		echo "$(GREEN)✓ Compilado$(RESET)"; \
	else \
		echo "$(YELLOW)○ Não compilado$(RESET)"; \
	fi
	@echo -n "$(BLUE)GCC:$(RESET)          "
	@if command -v gcc &> /dev/null; then \
		echo "$(GREEN)✓ Instalado$(RESET) ($$(gcc --version | head -n1))"; \
	else \
		echo "$(YELLOW)✗ Não instalado$(RESET)"; \
	fi
	@echo ""
	@echo -n "$(BLUE)C LCUI:$(RESET)       "
	@if [ -d c-lcui/build ]; then \
		echo "$(GREEN)✓ Compilado$(RESET)"; \
	else \
		echo "$(YELLOW)○ Não compilado$(RESET)"; \
	fi
	@echo -n "$(BLUE)XMake:$(RESET)        "
	@if command -v xmake &> /dev/null; then \
		echo "$(GREEN)✓ Instalado$(RESET) ($$(xmake --version | head -n1))"; \
	else \
		echo "$(YELLOW)✗ Não instalado$(RESET)"; \
	fi
	@echo -n "$(BLUE)Node.js:$(RESET)      "
	@if command -v node &> /dev/null; then \
		echo "$(GREEN)✓ Instalado$(RESET) ($$(node --version))"; \
	else \
		echo "$(YELLOW)✗ Não instalado$(RESET)"; \
	fi
	@echo ""
	@echo -n "$(BLUE)C# Uno:$(RESET)       "
	@if [ -d csharp-uno/bin ]; then \
		echo "$(GREEN)✓ Compilado$(RESET)"; \
	else \
		echo "$(YELLOW)○ Não compilado$(RESET)"; \
	fi
	@echo -n "$(BLUE).NET SDK:$(RESET)     "
	@if command -v dotnet &> /dev/null; then \
		echo "$(GREEN)✓ Instalado$(RESET) ($$(dotnet --version))"; \
	else \
		echo "$(YELLOW)✗ Não instalado$(RESET)"; \
	fi
	@echo ""

# ========== C CLI ==========
c-cli: c-cli-run

c-cli-build:
	@echo "$(BLUE)Compilando C CLI...$(RESET)"
	@$(MAKE) -C c-cli build

c-cli-run: c-cli-build
	@echo "$(BLUE)Executando C CLI...$(RESET)"
	@$(MAKE) -C c-cli run

c-cli-clean:
	@echo "$(BLUE)Limpando C CLI...$(RESET)"
	@$(MAKE) -C c-cli clean

# ========== C LCUI ==========
c-lcui: c-lcui-run-clean

c-lcui-install:
	@echo "$(BLUE)Instalando dependências C LCUI...$(RESET)"
	@$(MAKE) -C c-lcui install

c-lcui-install-fonts:
	@echo "$(BLUE)Instalando fontes para C LCUI...$(RESET)"
	@$(MAKE) -C c-lcui install-fonts

c-lcui-build:
	@echo "$(BLUE)Compilando C LCUI...$(RESET)"
	@$(MAKE) -C c-lcui build

c-lcui-run: c-lcui-build
	@echo "$(BLUE)Executando C LCUI...$(RESET)"
	@$(MAKE) -C c-lcui run

c-lcui-run-quiet: c-lcui-build
	@echo "$(BLUE)Executando C LCUI (modo silencioso)...$(RESET)"
	@$(MAKE) -C c-lcui run-quiet

c-lcui-run-clean: c-lcui-build
	@echo "$(BLUE)Executando C LCUI (modo limpo)...$(RESET)"
	@$(MAKE) -C c-lcui run-clean

c-lcui-clean:
	@echo "$(BLUE)Limpando C LCUI...$(RESET)"
	@$(MAKE) -C c-lcui clean

# ========== C# Uno Platform ==========
csharp: csharp-run

csharp-install:
	@echo "$(BLUE)Instalando workloads C#...$(RESET)"
	@$(MAKE) -C csharp-uno install

csharp-build:
	@echo "$(BLUE)Compilando C# Uno...$(RESET)"
	@$(MAKE) -C csharp-uno build

csharp-run: csharp-build
	@echo "$(BLUE)Executando C# Uno...$(RESET)"
	@$(MAKE) -C csharp-uno run

csharp-clean:
	@echo "$(BLUE)Limpando C# Uno...$(RESET)"
	@$(MAKE) -C csharp-uno clean

# ========== Comandos Globais ==========
install-all:
	@echo "$(BOLD)Instalando todas as dependências...$(RESET)"
	@echo ""
	@$(MAKE) c-lcui-install
	@echo ""
	@$(MAKE) csharp-install
	@echo ""
	@echo "$(GREEN)Todas as dependências instaladas!$(RESET)"

build-all:
	@echo "$(BOLD)Compilando todos os projetos...$(RESET)"
	@echo ""
	@$(MAKE) c-cli-build
	@echo ""
	@$(MAKE) c-lcui-build
	@echo ""
	@$(MAKE) csharp-build
	@echo ""
	@echo "$(GREEN)Todos os projetos compilados!$(RESET)"

clean-all:
	@echo "$(BOLD)Limpando todos os projetos...$(RESET)"
	@echo ""
	@$(MAKE) c-cli-clean
	@echo ""
	@$(MAKE) c-lcui-clean
	@echo ""
	@$(MAKE) csharp-clean
	@echo ""
	@echo "$(GREEN)Todos os projetos limpos!$(RESET)"
