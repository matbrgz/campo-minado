# Guia Completo: Erros de Fonte no LCUI

## O Problema

O LCUI tenta carregar várias fontes Ubuntu que não estão instaladas por padrão no sistema, resultando em ~50 linhas de mensagens como:

```
[font] failed to load file: /usr/share/fonts/truetype/ubuntu/Ubuntu-B.ttf
[font] failed to load file: /usr/share/fonts/truetype/ubuntu/Ubuntu-BI.ttf
...
```

Essas mensagens **NÃO afetam o funcionamento do jogo**, mas poluem a saída do console.

## Soluções Disponíveis

### 🎯 Solução 1: Modo Limpo (RECOMENDADA - Imediata)

Use o modo `run-clean` que filtra automaticamente todos os logs técnicos:

```bash
make run-clean
```

**Vantagens:**
- ✅ Funciona imediatamente
- ✅ Não requer instalação de pacotes
- ✅ Saída limpa e profissional

### 🔧 Solução 2: Instalar Fontes Ubuntu (Definitiva)

Instale as fontes Ubuntu para eliminar os erros na origem:

```bash
make install-fonts
```

Ou manualmente:
```bash
sudo apt-get update
sudo apt-get install fonts-ubuntu fonts-ubuntu-console
fc-cache -f
```

**Vantagens:**
- ✅ Elimina erros permanentemente
- ✅ Funciona em todos os modos (run, run-quiet, run-clean)
- ✅ Usa as fontes oficiais do Ubuntu

**Desvantagens:**
- ❌ Requer sudo e instalação de pacotes (~2MB)

### 🔇 Solução 3: Modo Silencioso (Intermediária)

Use o modo `run-quiet` que filtra a maioria dos logs:

```bash
make run-quiet
```

**Vantagens:**
- ✅ Não requer instalação
- ✅ Mostra alguns logs úteis

## Comparação dos Modos

| Modo | Logs Mostrados | Quando Usar |
|------|----------------|-------------|
| `run` | Todos (60+ linhas) | Debug e desenvolvimento |
| `run-quiet` | Filtrados (~10 linhas) | Uso normal com alguns logs |
| `run-clean` | Mínimos (~5 linhas) | **Recomendado** para usuários |

## Por Que os Erros Aparecem?

O LCUI tenta carregar fontes em várias variantes (Bold, Italic, Light, etc.) seguindo uma lista de fallback. Como as fontes Ubuntu não estão instaladas, ele tenta todas as variantes antes de usar as fontes `FluentSystemIcons` que estão incluídas no projeto.

## Fontes Que o LCUI Procura

1. Ubuntu (Regular, Bold, Italic, Light, Medium)
2. Ubuntu Mono (Regular, Bold, Italic)
3. Noto Sans CJK
4. WenQuanYi Micro Hei
5. **FluentSystemIcons** (✅ incluída no projeto)

## Recomendação

Para a melhor experiência:

1. **Para desenvolvedores:** Instale as fontes com `make install-fonts`
2. **Para usuários finais:** Use `make run-clean` (padrão)

## Perguntas Frequentes

**Q: O jogo funciona sem as fontes Ubuntu?**  
A: Sim! O jogo usa fontes incluídas (FluentSystemIcons). As mensagens de erro são apenas informativos.

**Q: Devo instalar as fontes?**  
A: Opcional. Use `run-clean` se não quiser instalar.

**Q: As fontes ocupam muito espaço?**  
A: Aproximadamente 2MB (fonts-ubuntu).

**Q: Posso usar outras fontes?**  
A: Sim! As fontes DejaVu e Liberation servem como substitutas automáticas.

## Arquivos Relacionados

- `Makefile` - Contém os targets `run-clean`, `run-quiet`, `install-fonts`
- `install-fonts.sh` - Script de instalação das fontes Ubuntu
- `fonts.conf` - Configuração fontconfig para substituição de fontes
