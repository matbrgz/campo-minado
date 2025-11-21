# Makefile para Campo Minado em C# com Uno Platform

PROJECT = MinesweeperUno.csproj
SOLUTION = MinesweeperUno.sln
FRAMEWORK_WASM = net9.0-browserwasm
FRAMEWORK_DESKTOP = net9.0-desktop
FRAMEWORK_ANDROID = net9.0-android
FRAMEWORK_IOS = net9.0-ios

.PHONY: all help install build run clean restore publish-wasm publish-desktop test

all: build

help:
	@echo "Campo Minado - C# com Uno Platform"
	@echo "==================================="
	@echo "Comandos disponíveis:"
	@echo "  make install         - Instala workloads do .NET"
	@echo "  make restore         - Restaura dependências NuGet"
	@echo "  make build           - Compila o projeto (WASM)"
	@echo "  make build-desktop   - Compila para Desktop"
	@echo "  make run             - Executa no navegador (WASM)"
	@echo "  make run-desktop     - Executa versão Desktop"
	@echo "  make publish-wasm    - Publica para WASM"
	@echo "  make publish-desktop - Publica para Desktop"
	@echo "  make clean           - Remove arquivos compilados"
	@echo "  make test            - Executa testes"
	@echo "  make help            - Mostra esta ajuda"

install:
	@echo "Instalando workloads do .NET para Uno Platform..."
	dotnet workload install wasm-tools
	@echo "Workloads instalados!"

restore:
	@echo "Restaurando dependências NuGet..."
	dotnet restore $(SOLUTION)
	@echo "Dependências restauradas!"

build: restore
	@echo "Compilando para WebAssembly..."
	dotnet build -p:Configuration=Debug -p:TargetFramework=$(FRAMEWORK_WASM) $(PROJECT)
	@echo "Compilação concluída!"

build-desktop: restore
	@echo "Compilando para Desktop..."
	dotnet build -p:Configuration=Debug -p:TargetFramework=$(FRAMEWORK_DESKTOP) $(PROJECT)
	@echo "Compilação concluída!"

run: build
	@echo "Executando no navegador (WebAssembly)..."
	dotnet run -p:Configuration=Debug -p:TargetFramework=$(FRAMEWORK_WASM) --project $(PROJECT)

run-desktop: build-desktop
	@echo "Executando versão Desktop..."
	dotnet run -p:Configuration=Debug -p:TargetFramework=$(FRAMEWORK_DESKTOP) --project $(PROJECT)

publish-wasm: restore
	@echo "Publicando para WebAssembly..."
	dotnet publish -c Release -p:TargetFramework=$(FRAMEWORK_WASM) $(PROJECT)
	@echo "Publicação concluída em: bin/Release/$(FRAMEWORK_WASM)/publish/"

publish-desktop: restore
	@echo "Publicando para Desktop..."
	dotnet publish -c Release -p:TargetFramework=$(FRAMEWORK_DESKTOP) $(PROJECT)
	@echo "Publicação concluída!"

test:
	@echo "Executando testes..."
	dotnet test $(SOLUTION)

clean:
	@echo "Limpando arquivos compilados..."
	dotnet clean $(SOLUTION)
	rm -rf bin obj
	@echo "Limpeza concluída!"
