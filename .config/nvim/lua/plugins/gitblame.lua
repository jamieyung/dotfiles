return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        enabled = false,
        message_template = '<author> - <date> - <summary> - <sha>',
        date_format = '%c',
        highlight_group = 'Question',
        delay = 0,
    },
}
