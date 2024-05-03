require('notify').setup {
    background_colour = "NotifyBackground",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade",
    time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
    },
    timeout = 200,
}
