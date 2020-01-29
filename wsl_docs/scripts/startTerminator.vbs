args = "-ac" & " -l " & """DISPLAY=$(awk '/nameserver/ {print $2}' /etc/resolv.conf):100.0 terminator"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0