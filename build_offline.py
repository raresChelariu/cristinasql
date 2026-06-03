# -*- coding: utf-8 -*-
"""Asambleaza o pagina index.html offline, autonoma, cu toate laboratoarele
incorporate (inline) si navigare prin sidebar (show/hide, fara fetch)."""
import os

ROOT = os.path.dirname(os.path.abspath(__file__))
LABDIR = os.path.join(ROOT, "laboratoare")

# (id_intern, nume_fisier_fragment, titlu_afisat)
LABS = [
    ("instalare", "instalare", "Instalare"),
    ("pgadmin",   "pgadmin",   "Ghid pgAdmin"),
    ("lab1",  "lab1",  "Laborator 1"),
    ("lab2",  "lab2",  "Laborator 2"),
    ("lab3",  "lab3",  "Laborator 3"),
    ("lab4",  "lab4",  "Laborator 4"),
    ("lab5",  "lab5",  "Laborator 5"),
    ("lab6",  "lab6",  "Laborator 6"),
    ("lab7",  "lab7",  "Laborator 7"),
    ("lab8",  "lab8",  "Laborator 8"),
    ("lab9",  "lab9",  "Laborator 9"),
    ("lab10", "lab10", "Laborator 10"),
    ("lab11", "lab11", "Laborator 11"),
    ("lab12", "lab12", "Laborator 12"),
    ("lab13", "lab13", "Laborator 13"),
    ("lab14", "lab14", "Laborator 14"),
]

def rewrite_links(html):
    # PDF-uri si alte documente de pe site -> folderul local documente/
    html = html.replace("https://edu.info.uaic.ro/baze-de-date/ro/documente/", "documente/")
    html = html.replace("http://edu.info.uaic.ro/baze-de-date/ro/documente/", "documente/")
    # script SQL -> versiunea PostgreSQL din radacina folderului
    html = html.replace("https://edu.info.uaic.ro/baze-de-date/resurse/script/facultate.sql",
                        "facultate.sql")
    # imaginea cu schema join-urilor -> imagine locala
    html = html.replace("http://i.stack.imgur.com/udQpD.jpg", "imagini/udQpD.jpg")
    html = html.replace("https://i.stack.imgur.com/udQpD.jpg", "imagini/udQpD.jpg")
    return html

sections = []
nav_items = []
for idx, (lid, fname, titlu) in enumerate(LABS):
    path = os.path.join(LABDIR, fname + ".html")
    with open(path, encoding="utf-8") as f:
        frag = f.read()
    frag = rewrite_links(frag)
    display = "block" if idx == 0 else "none"
    sections.append(
        f'<div id="lab_{lid}" class="lab-section" style="display:{display}">\n'
        f'<h2 class="lab-title">{titlu}</h2>\n{frag}\n</div>'
    )
    active = " active" if idx == 0 else ""
    nav_items.append(
        f'<li><a href="#" class="lab-link{active}" data-target="lab_{lid}" '
        f'onclick="showLab(\'lab_{lid}\', this); return false;">{titlu}</a></li>'
    )

sections_html = "\n\n".join(sections)
nav_html = "\n".join(nav_items)

page = f"""<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baze de Date - Laboratoare (offline)</title>
    <link rel="stylesheet" href="assets/bootstrap.min.css">
    <link rel="stylesheet" href="assets/stil.css">
    <link rel="stylesheet" href="assets/highlight.default.min.css">
    <script src="assets/highlight.min.js"></script>
    <script src="assets/highlight.r.min.js"></script>
    <style>
        body {{ margin: 0; }}
        .jumbotron-bd {{ background:#e9ecef; text-align:center; padding:25px; margin-bottom:0; }}
        .layout {{ display:flex; gap:20px; max-width:1200px; margin:20px auto; padding:0 15px; }}
        .sidebar {{ flex:0 0 220px; background:rgba(0,0,0,.06); border-radius:6px; padding:12px; height:fit-content; position:sticky; top:10px; }}
        .sidebar ul {{ list-style:none; padding:0; margin:0; }}
        .sidebar li {{ margin:2px 0; }}
        .sidebar a.lab-link {{ display:block; padding:6px 10px; border-radius:4px; color:#0a58ca; text-decoration:none; }}
        .sidebar a.lab-link:hover {{ background:rgba(0,0,0,.08); }}
        .sidebar a.lab-link.active {{ background:#0d6efd; color:#fff; }}
        .content {{ flex:1 1 auto; min-width:0; }}
        .lab-title {{ border-bottom:2px solid #dee2e6; padding-bottom:8px; margin-bottom:18px; }}
        .content img {{ max-width:100%; height:auto; }}
        pre {{ background:#f6f8fa; padding:12px; border-radius:6px; overflow:auto; }}
        .offline-note {{ font-size:.85em; color:#6c757d; margin-top:8px; }}
    </style>
</head>
<body>
    <div class="jumbotron-bd">
        <img src="imagini/BD.png" style="height:50px;"><br>
        <h1>Pagina disciplinei Baze de Date</h1>
        <p class="offline-note">Copie offline - sectiunea Laborator (PostgreSQL / pgAdmin).</p>
    </div>

    <div class="layout">
        <nav class="sidebar">
            <strong>Laborator</strong>
            <ul>
{nav_html}
            </ul>
        </nav>
        <main class="content" id="content">
{sections_html}
        </main>
    </div>

    <script>
        function showLab(id, el) {{
            document.querySelectorAll('.lab-section').forEach(function(s) {{ s.style.display='none'; }});
            var t = document.getElementById(id);
            if (t) t.style.display='block';
            document.querySelectorAll('.sidebar a.lab-link').forEach(function(a) {{ a.classList.remove('active'); }});
            if (el) el.classList.add('active');
            window.scrollTo(0,0);
        }}
        // evidentiere sintaxa SQL pentru tot continutul incarcat
        document.addEventListener('DOMContentLoaded', function() {{
            if (window.hljs) hljs.highlightAll();
        }});
    </script>
</body>
</html>
"""

out = os.path.join(ROOT, "index.html")
with open(out, "w", encoding="utf-8") as f:
    f.write(page)
print("Scris:", out, "(", len(page), "caractere )")
print("Laboratoare incluse:", len(LABS))
