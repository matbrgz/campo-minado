#!/bin/bash
# Script para criar links simbólicos de fontes ubuntu-font-family

echo "🔗 Criando links simbólicos..."

sudo mkdir -p /usr/share/fonts/truetype/ubuntu-font-family
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-R.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-B.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-RI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-BI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-L.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-LI.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-M.ttf
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-MI.ttf
sudo fc-cache -f

echo ""
echo "✅ Pronto! Os links foram criados."
echo "Execute: make c-lcui-run"
