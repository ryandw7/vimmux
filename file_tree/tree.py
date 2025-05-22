from pathlib import Path
p = Path

def get_dirs():
    current_dir = Path.cwd().name
    dirs = [f"{x}" for x in p().iterdir() if x.is_dir()]
    return {"current_dir":current_dir, "dirs":dirs}

print(get_dirs())
