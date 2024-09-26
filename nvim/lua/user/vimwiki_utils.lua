require('vimwiki_utils').setup({
    global = {
        rough_notes_dir = "1_rough_notes",
        source_dir = "2_source_material",
        tag_dir = "3_tags",
        atomic_notes_dir = "4_atomic_notes",
        screenshot_dir = "assets/screenshots",
        kolourpaint = "/snap/bin/kolourpaint"
    },
    keymaps = {
        vimwiki_utils_link_key = '<C-b>',
        vimwiki_utils_tags_key = '<C-e>',
        vimwiki_utils_rough_key = '<leader>nn',
        vimwiki_utils_backlinks_key = '<leader>fb',
        vimwiki_utils_sc_key = '<leader>sc',
        vimwiki_utils_edit_image_key = '<leader>ii',
        vimwiki_utils_source_key = '<leader>sm',
        vimwiki_utils_embed_key = '<leader>m',
        vimwiki_utils_generate_index_key = '<leader>wm'
    }
})
