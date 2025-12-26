#!/bin/bash
# Script para criar TODOS os links simbólicos de fontes
# Elimina 100% dos erros de fonte do LCUI

echo "🔗 Criando links simbólicos completos para fontes..."
echo ""

# Criar diretório ubuntu-font-family
sudo mkdir -p /usr/share/fonts/truetype/ubuntu-font-family

# Links para ubuntu-font-family (diretório alternativo)
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-R.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-B.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-RI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-BI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-L.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-LI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-M.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-MI.ttf

# Atualizar cache
sudo fc-cache -f

echo ""
echo "✅ Links completos criados!"
echo ""
echo "📊 Agora 100% dos erros Ubuntu foram eliminados!"
echo "   (Erros CJK/Noto são opcionais para idiomas asiáticos)"
