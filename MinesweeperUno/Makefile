.PHONY: build run clean

# The project to build and run
PROJECT = MinesweeperUno/MinesweeperUno.csproj

# The target framework
FRAMEWORK = net9.0-browserwasm

build:
	dotnet build -p:Configuration=Debug -p:TargetFramework=$(FRAMEWORK) $(PROJECT)

run: build
	dotnet run -p:Configuration=Debug -p:TargetFramework=$(FRAMEWORK) --project $(PROJECT)

clean:
	dotnet clean $(PROJECT)
