# Makefile para Campo Minado em C com LCUI

# Detecta xmake em locais comuns
XMAKE := $(shell command -v xmake 2>/dev/null || echo "$(HOME)/.local/bin/xmake")

# Marca de instalação
NODE_MODULES_INSTALLED := node_modules/.installed
BUILD_CONFIGURED := .xmake/.configured

.PHONY: all install install-fonts build run run-quiet run-clean clean distclean help check-xmake

all: run-clean

help:
	@echo "Campo Minado - C com LCUI"
	@echo "=============================="
	@echo "Comandos disponíveis:"
	@echo "  make install        - Instala dependências (xmake, yarn)"
	@echo "  make install-fonts  - Instala fontes Ubuntu (elimina erros)"
	@echo "  make build          - Compila o projeto"
	@echo "  make run-clean      - Executa (limpo - RECOMENDADO)"
	@echo "  make run-quiet      - Executa (silencioso)"
	@echo "  make run            - Executa (verbose - debug)"
	@echo "  make clean          - Remove arquivos compilados"
	@echo "  make distclean      - Remove build e dependências"
	@echo "  make help           - Mostra esta ajuda"
	@echo ""
	@echo "💡 Dica: Para eliminar erros de fonte definitivamente:"
	@echo "   make install-fonts"

check-xmake:
	@if [ ! -x "$(XMAKE)" ]; then \
		if ! command -v xmake &> /dev/null; then \
			echo "❌ xmake não encontrado."; \
			echo "Instale com: curl -fsSL https://xmake.io/shget.text | bash"; \
			echo "Ou visite: https://xmake.io"; \
			exit 1; \
		fi; \
	fi

$(NODE_MODULES_INSTALLED): package.json
	@echo "Instalando dependências Node.js..."
	@if ! command -v yarn &> /dev/null; then \
		npm install; \
	else \
		yarn install; \
	fi
	@touch $(NODE_MODULES_INSTALLED)
	@echo "✓ Dependências instaladas!"

install: check-xmake $(NODE_MODULES_INSTALLED)

install-fonts:
	@echo "Criando links simbólicos para fontes..."
	@./create-font-links.sh

$(BUILD_CONFIGURED):
	@$(XMAKE) f --cflags="-Wno-format-overflow -Wno-unused-variable -Wno-unknown-pragmas" > /dev/null 2>&1
	@mkdir -p .xmake
	@touch $(BUILD_CONFIGURED)

build: check-xmake $(NODE_MODULES_INSTALLED) $(BUILD_CONFIGURED)
	@echo "Compilando projeto LCUI..."
	@$(XMAKE)
	@echo "✓ Compilação concluída!"

run: build
	@echo "Executando Campo Minado LCUI..."
	@echo "Pressione Ctrl+C ou feche a janela para sair"
	@echo ""
	@./build/linux/x86_64/release/app

run-quiet: build
	@echo "Executando Campo Minado LCUI (modo silencioso)..."
	@echo "Pressione Ctrl+C ou feche a janela para sair"
	@echo ""
	@$(XMAKE) run 2>&1 | grep -v "^\[font\]" | grep -v "^\[ui-server\]" | grep -v "^\[ime\]" || true

run-clean: build
	@echo "╔════════════════════════════════════════════════╗"
	@echo "║     Campo Minado LCUI - Iniciando...         ║"
	@echo "╚════════════════════════════════════════════════╝"
	@echo ""
	@echo "🎮 Jogo em execução..."
	@echo "💡 Feche a janela ou pressione Ctrl+C para sair"
	@echo ""
	@echo "LCUI (LC's UI) - Minesweeper"
	@echo ""
	@$(XMAKE) run 2>&1 | \
		grep -v "^\[font\]" | \
		grep -v "^\[ui-server\]" | \
		grep -v "^\[ime\]" | \
		grep -v "^\[app\]" | \
		grep -v "^LCUI" | \
		grep -v "^Build at" | \
		grep -v "^Copyright" | \
		grep -v "^This is open source" | \
		grep -v "^See source" | \
		grep -v "^To learn more" || true
	@echo ""
	@echo "✓ Jogo encerrado"

clean:
	@echo "Limpando arquivos de build..."
	@if [ -f "$(XMAKE)" ] || command -v xmake &> /dev/null; then \
		$(XMAKE) clean; \
	fi
	@rm -f $(BUILD_CONFIGURED)
	@echo "✓ Limpeza concluída!"

distclean:
	@echo "Removendo todos os arquivos gerados..."
	@if [ -f "$(XMAKE)" ] || command -v xmake &> /dev/null; then \
		$(XMAKE) distclean 2>/dev/null || true; \
	fi
	@rm -rf node_modules vendor.node_modules dist build
	@rm -f $(NODE_MODULES_INSTALLED) $(BUILD_CONFIGURED)
	@echo "✓ Limpeza completa concluída!"
