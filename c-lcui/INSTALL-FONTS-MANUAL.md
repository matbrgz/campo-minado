# Guia: Eliminar Erros de Fonte LCUI (Debian)

## Problema

O LCUI procura fontes Ubuntu nos caminhos `/usr/share/fonts/truetype/ubuntu/`, mas no Debian essas fontes não estão disponíveis. As fontes DejaVu (já instaladas) são excelentes substitutas.

## Solução: Links Simbólicos

Execute os comandos abaixo para criar links simbólicos das fontes DejaVu para os caminhos que o LCUI espera:

```bash
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
```

## Comando Único (Copiar e Colar)

Ou execute tudo de uma vez:

```bash
sudo mkdir -p /usr/share/fonts/truetype/ubuntu && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-R.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-B.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-RI.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-BI.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-L.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-LI.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-M.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-MI.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf /usr/share/fonts/truetype/ubuntu/Ubuntu-C.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-R.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono-Bold.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-B.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono-Oblique.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-RI.ttf && \
sudo ln -sf /usr/share/fonts/truetype/dejavu/DejaVuSansMono-BoldOblique.ttf /usr/share/fonts/truetype/ubuntu/UbuntuMono-BI.ttf && \
sudo fc-cache -f && \
echo "✅ Links simbólicos criados! Execute 'make run' para testar."
```

## Resultado Esperado

Após executar os comandos acima, os erros `[font] failed to load file: /usr/share/fonts/truetype/ubuntu/Ubuntu-*.ttf` serão **completamente eliminados**.

## Verificação

Para verificar que os links foram criados:

```bash
ls -la /usr/share/fonts/truetype/ubuntu/
```

## Alternativa

Se você não quiser criar os links, pode continuar usando:

```bash
make run-clean  # Executa filtrando os erros de fonte
```
