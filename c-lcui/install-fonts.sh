#!/bin/bash
# Script para instalar fontes e resolver erros do LCUI
# Funciona em Debian e Ubuntu

echo "╔════════════════════════════════════════════════════════╗"
echo "║  Instalador de Fontes para LCUI                       ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# Verifica se está no Debian/Ubuntu
if ! command -v apt-get &> /dev/null; then
    echo "❌ Este script funciona apenas em sistemas Debian/Ubuntu"
    echo "💡 Use 'make run-clean' para executar sem logs de erro"
    exit 1
fi

# Detecta a distribuição
if [ -f /etc/debian_version ]; then
    DISTRO="Debian"
    # Fontes disponíveis no Debian
    FONTS_PKG="fonts-dejavu fonts-dejavu-extra fonts-liberation fonts-liberation2"
else
    DISTRO="Ubuntu"
    # Fontes específicas do Ubuntu
    FONTS_PKG="fonts-ubuntu fonts-ubuntu-console"
fi

echo "🐧 Sistema detectado: $DISTRO"
echo "📦 Instalando fontes compatíveis..."
echo ""

# Atualiza lista de pacotes
echo "🔄 Atualizando lista de pacotes..."
sudo apt-get update -qq

# Instala as fontes
echo "📥 Instalando $FONTS_PKG..."
sudo apt-get install -y $FONTS_PKG

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Fontes instaladas com sucesso!"
    echo "🔄 Atualizando cache de fontes..."
    fc-cache -f > /dev/null 2>&1
    echo "✓ Cache atualizado!"

    # Se for Debian, criar links simbólicos para eliminar erros do LCUI
    if [ "$DISTRO" = "Debian" ]; then
        echo ""
        echo "🔗 Criando links simbólicos para fontes Ubuntu..."

        # Criar diretório se não existir
        sudo mkdir -p /usr/share/fonts/truetype/ubuntu

        # Links para Ubuntu Regular
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-R.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-B.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-RI.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-BI.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-L.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-LI.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-M.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-MI.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-C.ttf

        # Links para Ubuntu Mono
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-R.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono-Bold.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-B.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono-Oblique.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-RI.ttf
        sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-BI.ttf

        echo "✓ Links simbólicos criados!"
        fc-cache -f > /dev/null 2>&1
    fi

    echo ""
    echo "📊 Fontes instaladas:"

    if [ "$DISTRO" = "Debian" ]; then
        echo "  • DejaVu Sans → Ubuntu (via links simbólicos)"
        echo "  • DejaVu Sans Mono → Ubuntu Mono (via links simbólicos)"
        echo "  • Liberation Sans"
    else
        echo "  • Ubuntu Regular, Bold, Italic, Light"
        echo "  • Ubuntu Mono"
    fi

    echo ""
    echo "🎮 Agora você pode executar SEM erros de fonte:"
    echo "   make run"
    echo ""
    echo "✨ Os erros [font] failed to load foram ELIMINADOS!"
else
    echo ""
    echo "❌ Erro ao instalar fontes"
    echo "💡 Você ainda pode usar 'make run-clean' para executar sem logs"
fi
