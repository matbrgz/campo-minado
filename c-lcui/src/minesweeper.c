#include <LCUI.h>
#include <ptk/main.h>

int main(int argc, char **argv)
{
    ui_widget_t *root, *title;

    lcui_init();

    root = ui_create_widget(NULL);

    // Simple title
    title = ui_create_widget("text");
    ui_text_set_content_w(title, L"CAMPO MINADO - TESTE");
    ui_widget_set_style_string(title, "font-family", "inconsolata");
    ui_widget_set_style_string(title, "font-size", "24px");
    ui_widget_set_style_string(title, "padding", "20px");
    ui_widget_append(root, title);

    ui_root_append(root);
    ui_widget_unwrap(root);

    return lcui_main();
}
