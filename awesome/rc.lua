pcall(require, "luarocks.loader")
require("awful.autofocus")
require("collision")()

local keyboard_layout = require("keyboard_layout")
local gears = require("gears")
local awful = require("awful")
package.loaded["naughty.dbus"] = {}


local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")


-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init("/home/malte/.config/awesome/default/theme.lua")
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Gaps
-- beautiful.useless_gap = 10
beautiful.useless_gap = 0

-- This is used later as the default terminal and editor to run.
local terminal = "ghostty"
local editor = "nvim"
local editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
    { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual",      terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart",     awesome.restart },
    { "quit",        function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome },
        after = { menu_terminal }
    })
else
    mymainmenu = awful.menu({
        items = {
            menu_awesome,
            { "Debian", debian.menu.Debian_menu.Debian },
            menu_terminal,
        }
    })
end


-- mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
--                                      menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard switch and setup
local kbdcfg = keyboard_layout.kbdcfg({ type = "tui" })

kbdcfg.add_primary_layout("Deutsch", "DE", "de")
kbdcfg.add_primary_layout("English", "US", "us")
kbdcfg.bind()

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
end)

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({}, 3, function() mymainmenu:toggle() end)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

    awful.key({ modkey, }, "space", function() kbdcfg.switch_next() end),
    awful.key({ modkey, }, "s", hotkeys_popup.show_help,
        { description = "show help", group = "awesome" }),
    awful.key({ modkey, }, "Left", awful.tag.viewprev,
        { description = "view previous", group = "tag" }),
    awful.key({ modkey, }, "Right", awful.tag.viewnext,
        { description = "view next", group = "tag" }),
    awful.key({ modkey, }, "Escape", awful.tag.history.restore,
        { description = "go back", group = "tag" }),

    awful.key({ modkey, }, "j",
        function()
            awful.client.focus.byidx(1)
        end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key({ modkey, }, "k",
        function()
            awful.client.focus.byidx(-1)
        end,
        { description = "focus previous by index", group = "client" }
    ),
    -- awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
    --           {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),
    awful.key({ modkey, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),

    -- Standard program
    awful.key({ modkey, }, "Return", function() awful.spawn("ghostty") end,
        { description = "open a terminal", group = "launcher" }),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" }),
    awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout" }),
    awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = "layout" }),
    awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
        { description = "increase the number of master clients", group = "layout" }),
    awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),
    awful.key({ modkey, }, "space", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    awful.key({ modkey, "Control" }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "restore minimized", group = "client" }),

    -- TMUX
    awful.key({ modkey }, "t", function() awful.spawn("ghostty -e tmux attach #a") end,
        { description = "Spawn Tmux", group = "malte" }),

    -- POWER MENU
    awful.key({ modkey }, "0", function() awful.spawn("/home/malte/.config/polybar/scripts/powermenu.sh") end,
        { description = "Open Powermenu", group = "malte" }),

    -- Brave
    awful.key({ modkey }, "b", function()
            awful.util.spawn("brave-browser")
            local screen = awful.screen.focused()
            local tag = screen.tags[2] -- Change '2' to the tag number you want to switch to
            if tag then
                tag:view_only()
            end
        end,
        { description = "launch brave browser", group = "malte" }),


    -- cost session
    -- awful.key({ modkey }, "c", function()
    --         awful.spawn("ssh -i ~/.ssh/norm -t mweyrich@10.162.163.34 'tmux new-session -A -s CIRCEST'")
    --     end,
    --     { description = "Connect to CIRCEST session", group = "malte" }),
    awful.key(
        { modkey }, "c",
        function()
            awful.spawn.with_shell("ghostty -e env TERM=xterm-256color ssh -i ~/.ssh/norm -t mweyrich@10.162.163.34 tmux new-session -A -s CIRCEST")
        end,
        { description = "Connect to CIRCEST session", group = "malte" }
    ),

    -- cip session
    awful.key({ modkey }, "x", function()
            awful.spawn.with_shell("ghostty -e env TERM=xterm-256color ssh -i ~/.ssh/cip -t weyrichm@remote.cip.ifi.lmu.de tmux new-session -A -s cip")
        end,
        { description = "Connect to cip session", group = "malte" }),

    -- Settings
    awful.key({ "Control", modkey }, "s", function()
            awful.util.spawn("env XDG_CURRENT_DESKTOP=GNOME gnome-control-center")
        end,
        { description = "launch settings", group = "malte" }),

    -- Rofi
    awful.key({ modkey }, "w", function()
            awful.util.spawn("rofi -show window -show-icons")
        end,
        { description = "show all windows", group = "malte" }),

    awful.key({ modkey }, "p", function()
        awful.util.spawn("rofi -show drun -disable-history -sort -show-icons")
        -- awful.util.spawn("/home/malte/.config/_polybar/blocks/scripts/launcher.sh")
    end),

    awful.key({ modkey }, "v", function()
            awful.spawn("/home/malte/.config/scripts/vim_anywhere.sh")
        end,
        { description = "Quick math equations on the fly", group = "malte" }),

    -- screenshot
    awful.key({ modkey }, "i", function()
            awful.spawn("/home/malte/.config/scripts/screenshot.sh")
        end,
        { description = "Simple screenshot script", group = "malte" })

)
-- awful.key({ modkey }, "x",
--           function ()
--               awful.prompt.run {
--                 prompt       = "Run Lua code: ",
--                 textbox      = awful.screen.focused().mypromptbox.widget,
--                 exe_callback = awful.util.eval,
--                 history_path = awful.util.get_cache_dir() .. "/history_eval"
--               }
--           end,
--           {description = "lua execute prompt", group = "awesome"}),
-- Menubar
-- awful.key({ modkey }, "p", function() menubar.show() end,
--           {description = "show the menubar", group = "launcher"})

clientkeys = gears.table.join(
    awful.key({ modkey, }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey }, "q", function(c) c:kill() end,
        { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),
    awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" }),
    awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey, }, "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "minimize", group = "client" }),
    awful.key({ modkey, }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = "client" }),
    awful.key({ modkey, "Control" }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description = "(un)maximize vertically", group = "client" }),
    awful.key({ modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).


awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},

        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },


    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA",   -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer" },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow",   -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    },

    -- Rule for Polybar
    {
        rule = { class = "Polybar" },
        properties = { below = true, floating = true, focusable = false }
    },

    -- Brave Browser
    {
        rule = { class = "Brave-browser" },
        properties = { screen = function() return awful.screen.focused() end, tag = "2" }
    },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

-- Border color and width
client.connect_signal("focus", function(c) c.border_color = "#CB775D" end)
client.connect_signal("focus", function(c) c.border_width = 2 end)
client.connect_signal("unfocus", function(c) c.border_color = '#888888' end)
client.connect_signal("unfocus", function(c) c.border_width = 2 end)
-- }}}
--

local function update_tags()
    local taglist = ""
    local screen = awful.screen.focused()

    for _, t in ipairs(screen.tags) do
        if t.selected then
            taglist = taglist .. "%{F#CB775D}" .. t.name .. "%{F-} " -- Highlight active tag
        elseif #t:clients() > 0 then
            taglist = taglist .. "%{F#FFFFFF}" .. t.name .. "%{F-} " -- Highlight tags with windows
        else
            taglist = taglist .. "%{F#666666}" .. t.name .. "%{F-} " -- Inactive tags
        end
    end

    -- Send the taglist string to Polybar via a pipe
    awful.spawn.easy_async_with_shell("echo '" .. taglist .. "' > /tmp/polybar-tags", function() end)
end

-- Connect the update function to the tag signals
awful.tag.attached_connect_signal(nil, "property::selected", update_tags)
awful.tag.attached_connect_signal(nil, "property::layout", update_tags)
awful.tag.attached_connect_signal(nil, "property::urgent", update_tags)

-- Initial update when Awesome starts
gears.timer.delayed_call(update_tags)

-- AUTOSTART
awful.util.spawn_with_shell("pgrep -u $USER -x nm-applet > /dev/null || (nm-applet &)") -- Network Manager
awful.spawn.with_shell("brave-browser")
awful.spawn.with_shell("killall polybar; polybar top &")
-- awful.spawn.with_shell("ghostty -e tmux new-session -s home 'zsh -c \"nvim; exec zsh\"'")
awful.spawn.with_shell("ghostty -e tmux new-session -s home")
awful.spawn.with_shell("sleep 1 && nitrogen --restore")
awful.spawn.with_shell("picom -b")
awful.spawn.with_shell("/home/malte/.config/polybar/launch.sh")
