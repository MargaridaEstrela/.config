#!/usr/bin/python3

import os, json, re, time

ICON_MAP = [
    {"regex": r"App Store", "icon": ""},
    {"regex": r"Adobe Lightroom Classic", "icon": "􀟗"},
    {"regex": r"Adobe Photoshop 2024", "icon": "􀟗"},
    {"regex": r"Brave Browser", "icon": ""},
    {"regex": r"Calendar|Fantastical", "icon": "󰃭"},
    {"regex": r"Chromium|Google Chrome|Google Chrome Canary", "icon": ""},
    {"regex": r"Code|Code - Insiders", "icon": "󰨞"},
    {"regex": r"Discord|Discord Canary|Discord PTB", "icon": "󰙯"},
    {"regex": r"FaceTime", "icon": "􀍊"},
    {"regex": r"Figma", "icon": "􀜎"},
    {"regex": r"Finder", "icon": "󰀶"},
    {"regex": r"iTerm2", "icon": "􀪏"},
    {"regex": r"Keynote", "icon": ""},
    {"regex": r"Mail", "icon": "􀍘"},
    {"regex": r"Maps", "icon": "􀙋"},
    {"regex": r"Matlab", "icon": ""},
    {"regex": r"Messages|Nachrichten", "icon": "􀌥"},
    {"regex": r"Microsoft Excel", "icon": "󱎏"},
    {"regex": r"Microsoft PowerPoint", "icon": "󱎐"},
    {"regex": r"Microsoft Teams", "icon": "󰊻"},
    {"regex": r"Microsoft Word", "icon": "󱎒"},
    {"regex": r"Music", "icon": ""},
    {"regex": r"Notes", "icon": ""},
    {"regex": r"Notion", "icon": "󰰒"},
    {"regex": r"Numbers", "icon": "􀣉"},
    {"regex": r"Pages", "icon": "􁚛"},
    {"regex": r"Parallels Desktop", "icon": "􀟛"},
    {"regex": r"Podcasts", "icon": ""},
    {"regex": r"Preview", "icon": "􀹃"},
    {"regex": r"Reminders", "icon": ""},
    {"regex": r"Safari", "icon": "󰀹"},
    {"regex": r"Slack", "icon": "󰒱"},
    {"regex": r"Spotify", "icon": "󰓇"},
    {"regex": r"Stremio", "icon": "􁚱"},
    {"regex": r"System Preferences|System Settings", "icon": "􀍟"},
    {"regex": r"WhatsApp", "icon": "􀌤"},
    {"regex": r"Xcode", "icon": "󰰰"},
]


def to_sup(s):
    sups = {u'0': u'\u2070',
            u'1': u'\xb9',
            u'2': u'\xb2',
            u'3': u'\xb3',
            u'4': u'\u2074',
            u'5': u'\u2075',
            u'6': u'\u2076',
            u'7': u'\u2077',
            u'8': u'\u2078',
            u'9': u'\u2079'}

    return ''.join(sups.get(char, char) for char in str(s))


def to_icon(app):
    for x in ICON_MAP:
        if re.search(x['regex'], app):
            return x['icon']
    return ''


def to_formatted_icon(app, c):
    cnt = f" {to_sup(c)}" if c > 1 else ''
    return f"{to_icon(app)}{cnt}"


def to_formatted_icons(apps):
    # Filter out entries without icons
    apps = {app: cnt for app, cnt in apps.items() if to_icon(app)}
    return '   '.join([to_formatted_icon(app, cnt) for app, cnt in apps.items()])

def reset_labels_and_add_icons(spaces):
    args = ' '.join([f'--set space.{space} label="{to_formatted_icons(apps)}" label.drawing=on' for space, apps in spaces.items()])
    os.system(f'sketchybar --set "/space\..*/" label="" label.drawing=off {args}')

spaces = {}
apps = json.loads(os.popen('yabai -m query --windows').read())
for app in apps:
    spaces[app['space']] = spaces.get(app['space'], {})
    spaces[app['space']][app['app']] = spaces[app['space']].get(app['app'], 0) + 1

# Reset the labels for all spaces
reset_labels_and_add_icons(spaces)

# Additional arguments for the default settings
default_args = "--set spaces_bracket drawing=off --set '/space\..*/' background.drawing=on"

os.system(f'sketchybar -m {default_args}')