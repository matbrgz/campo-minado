#!/bin/bash
# Script para eliminar os 8 erros restantes de fontes ubuntu-font-family

set -e  # Para se houver erro

echo "╔════════════════════════════════════════════════════════╗"
echo "║  Corrigindo erros restantes de fontes                 ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "🔗 Criando links para ubuntu-font-family..."
echo ""

# Verificar se tem sudo
if ! sudo -v; then
    echo "❌ Erro: sudo é necessário"
    exit 1
fi

# Criar diretório
echo "📁 Criando diretório ubuntu-font-family..."
sudo mkdir -p /usr/share/fonts/truetype/ubuntu-font-family

# Criar links
echo "🔗 Criando links simbólicos..."
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-R.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-B.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-RI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-BI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-L.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-LI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-M.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-MI.ttf

echo "✓ Links criados!"
echo ""

# Atualizar cache
echo "🔄 Atualizando cache de fontes..."
sudo fc-cache -f
echo "✓ Cache atualizado!"
echo ""

# Verificar
echo "📊 Verificando links criados:"
ls -lah /usr/share/fonts/truetype/ubuntu-font-family/ 2>/dev/null | grep Ubuntu || echo "Diretório vazio"
echo ""

echo "✅ Concluído!"
echo ""
echo "🎮 Os 8 erros de ubuntu-font-family foram eliminados!"
echo "   Agora execute: make run"
echo ""
echo "⚠️  Apenas 3 erros CJK (fontes asiáticas) ainda vão aparecer"
echo "   Isso é normal e não afeta o jogo."
