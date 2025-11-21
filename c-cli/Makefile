# Makefile para Campo Minado em C (CLI)

CC = gcc
CFLAGS = -Wall -Wextra -std=c11
TARGET = campominado
SRC = campominado.c

.PHONY: all build run clean help

all: build

help:
	@echo "Campo Minado - C CLI"
	@echo "===================="
	@echo "Comandos disponíveis:"
	@echo "  make build    - Compila o projeto"
	@echo "  make run      - Executa o jogo"
	@echo "  make clean    - Remove arquivos compilados"
	@echo "  make help     - Mostra esta ajuda"

build:
	@echo "Compilando $(TARGET)..."
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)
	@echo "Compilação concluída!"

run: build
	@echo "Executando $(TARGET)..."
	./$(TARGET)

clean:
	@echo "Limpando arquivos compilados..."
	rm -f $(TARGET)
	@echo "Limpeza concluída!"
