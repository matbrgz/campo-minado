#!/bin/bash
# Wrapper para executar LCUI sem logs de fonte

# Redireciona stderr para filtrar logs
exec 2> >(grep -v "^\[font\]" | grep -v "^\[ui-server\]" | grep -v "^\[ime\]" | grep -v "^\[app\]" >&2)

# Executa o app
~/.local/bin/xmake run app 2>&1 | grep -v "^\[font\]" | grep -v "^\[ui-server\]" | grep -v "^\[ime\]" | grep -v "^\[app\]"
