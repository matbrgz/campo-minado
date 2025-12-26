# Campo Minado - C com LCUI

⚠️ **STATUS: EM DESENVOLVIMENTO / EXPERIMENTAL**

Implementação do jogo Campo Minado em C usando a biblioteca LCUI para interface gráfica.

## ⚠️ Problemas Conhecidos

Esta implementação está em desenvolvimento e apresenta problemas:

1. **Segmentation Fault**: A aplicação crashes ao executar no ambiente atual
2. **Renderização de Texto**: Problemas com renderização de fontes no LCUI 3.0.0-alpha
3. **Compatibilidade**: Possíveis problemas com X11/WSL2

**RECOMENDAÇÃO**: Use a implementação **C CLI** (`c-cli/`) que funciona perfeitamente!

## Descrição

Esta versão utiliza LCUI (LC's User Interface), uma biblioteca C para criar interfaces gráficas com suporte a CSS e TypeScript/TSX.

## Requisitos

Para executar este projeto você precisará:

- [Git](https://git-scm.com)
- [Node.js](https://nodejs.org/en/download/) (inclui [npm](http://npmjs.com))
- [XMake](https://xmake.io/) - Sistema de build para C/C++
- GCC ou outro compilador C

## Como Usar

### Instalar dependências

```bash
make install
```

### 🔧 Eliminar Erros de Fonte (OPCIONAL)

Se você quiser eliminar completamente os erros de fonte `[font] failed to load`:

#### Opção 1: Script Automático (requer sudo)

```bash
make install-fonts
```

O script detecta automaticamente seu sistema:
- **Debian:** Cria links simbólicos DejaVu → Ubuntu
- **Ubuntu:** Instala `fonts-ubuntu` e `fonts-ubuntu-console`

#### Opção 2: Manual (Debian)

Veja os comandos completos em: **[INSTALL-FONTS-MANUAL.md](INSTALL-FONTS-MANUAL.md)**

Ou execute este comando único:

```bash
sudo mkdir -p /usr/share/fonts/truetype/ubuntu && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-R.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-B.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-R.ttf && \
sudo fc-cache -f
```

**Nota:** Você não precisa instalar as fontes para usar o jogo. O comando `make run-clean` já oculta esses erros automaticamente.

### Compilar

```bash
make build
```

### Executar

```bash
# Modo verbose (mostra todos os logs - útil para debug)
make run

# Modo silencioso (filtra logs de fonte e UI)
make run-quiet

# Modo limpo (apenas mensagens essenciais - RECOMENDADO)
make run-clean
```

**Recomendação:** Use `make run-clean` para uma experiência limpa sem logs técnicos.

### Limpar arquivos compilados

```bash
make clean
```

### Limpeza completa (remove dependências)

```bash
make distclean
```

### Ver ajuda

```bash
make help
```

## Instalação Manual (alternativa)

```bash
# Instalar ferramenta CLI do LCUI
npm install -g @lcui/cli

# Instalar dependências do projeto
npm install

# Compilar com LCUI
lcui build

# Executar
xmake run app
```

## Estrutura do Projeto

- `app/` - Código fonte e recursos da aplicação
  - `page.tsx` - Interface principal em TSX
  - `page.c` - Código C da página principal
  - `global.css` - Estilos globais
  - `main.c` - Ponto de entrada da aplicação
- `xmake.lua` - Configuração do XMake
- `package.json` - Dependências Node.js
- `tailwind.config.js` - Configuração Tailwind CSS
- `tsconfig.json` - Configuração TypeScript

## Tecnologias

- **LCUI** - Framework UI em C
- **TypeScript/TSX** - Para componentes UI
- **Tailwind CSS** - Para estilização
- **XMake** - Sistema de build

## Licença

Veja o arquivo LICENSE.txt para mais detalhes.
