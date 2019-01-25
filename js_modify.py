#!/usr/bin/env python3

changed_color = "red"

with open('script.js') as fin, open('newprefs.js', 'w') as fout:
    for line in fin:
        if """change_color.innerHTML= change_color.innerHTML.replace(decodeURI("C%C3%92N"), "<span style='color:black;'>"+decodeURI("C%C3%92N")+"</span>");""" in line:
            line = """change_color.innerHTML= change_color.innerHTML.replace(decodeURI("C%C3%92N"), "<span style='color:""" + changed_color + """;'>"+decodeURI("C%C3%92N")+"</span>");\n"""
        fout.write(line)                