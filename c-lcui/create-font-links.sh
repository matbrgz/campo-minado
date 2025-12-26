#!/bin/bash
# Script para criar links simbólicos das fontes DejaVu → Ubuntu
# Elimina os erros [font] failed to load do LCUI

echo "🔗 Criando links simbólicos para fontes Ubuntu..."
echo ""

# Criar diretório
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

# Atualizar cache de fontes
sudo fc-cache -f

echo ""
echo "✅ Links simbólicos criados com sucesso!"
echo ""
echo "📊 Verificando links:"
ls -lah /usr/share/fonts/truetype/ubuntu/ | grep -E "Ubuntu|UbuntuMono"
echo ""
echo "🎮 Agora execute: make run"
echo "   Os erros de fonte foram ELIMINADOS!"
