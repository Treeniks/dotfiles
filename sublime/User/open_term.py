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

