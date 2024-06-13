import sublime
from sublime_plugin import ApplicationCommand
import subprocess

class StartCommandInCwd(ApplicationCommand):
    def run(self, command: str):
        window = sublime.active_window() # the active window
        folders = window.folders() # list of folders opened in the window
        if len(folders) > 0:
            cwd = folders[0]
            subprocess.Popen(command, cwd = cwd)

from LSP.plugin.core.settings import userprefs

# after running the command, also run save once for it to take effect
class ToggleDiagnostics(ApplicationCommand):
    def run(self):
        if (userprefs().show_diagnostics_severity_level == 0):
            userprefs().show_diagnostics_severity_level = 4
        else:
            userprefs().show_diagnostics_severity_level = 0

