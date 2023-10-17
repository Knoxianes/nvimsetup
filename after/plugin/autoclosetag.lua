local filetypes = {
    'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
    'xml',
    'php',
    'markdown',
    'astro', 'glimmer', 'handlebars', 'hbs',
    "go.tmpl","go.txt","go.tpl"
}
require('nvim-ts-autotag').setup({
    filetypes = filetypes,
})

