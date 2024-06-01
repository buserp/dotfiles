import os

from collections import namedtuple
from pathlib import Path
from typing import List, Tuple
from urllib import request
from sys import exit, platform

PathVariant = namedtuple('PathVariant', ['file_path', 'nix', 'win'])

VIM_PLUGGED_URL = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
VIM_PLUGGED_PATH = PathVariant('plug.vim',
                       nix=Path(Path.home(), '.config', 'nvim', 'autoload', 'plug.vim'),
                       win=Path(Path.home(), 'AppData', 'Local', 'nvim', 'autoload', 'plug.vim')
)

LINKS = [
    PathVariant('vimrc',
      nix=Path(Path.home(), '.vimrc'),
      win=Path(Path.home(), '_vimrc')),
    PathVariant('vimrc',
      nix=Path(Path.home(), '.config', 'nvim', 'init.vim'),
      win=Path(Path.home(), 'AppData', 'Local', 'nvim', 'init.vim')),
    PathVariant('tmux.conf',
      nix=Path(Path.home(), 'tmux.conf'),
      win=None),
    PathVariant('zshrc',
      nix=Path(Path.home(), '.zshrc'),
      win=None)
]

def prompt(question: str):
  ans = input(question)
  if not ans.lower().startswith('y'):
    print('exiting...')
    exit(1)

def make_links(links: List[Tuple[Path, Path]]):
  print('will create the following hard links:')
  for f, l in links:
    print(f'{l} --> {f}')

  prompt('ok to continue? (y/N): ')
  for f, l in links:
    try:
      os.makedirs(l.parent)
    except OSError:
      print(f'directory {l.parent} already exists')
    os.link(f, l)
  print(f'{len(links)} link{"s" if len(links) > 1 else ""} created.')


def main():
  variant_index = None
  if platform == 'linux' or platform == 'linux2':
    variant_index = 1
  elif platform == 'win32':
    variant_index = 2
  if not variant_index:
    print(f'unsupported operating system: {platform}')
    exit(1)

  hot = []
  for link in LINKS:
    f: Path = Path(link[0]).resolve()
    l: Path = link[variant_index]
    if not l:
      print(f'no {platform} variant for {f}, skipping...')
      continue
    if l.exists():
      print(f'{l} already exists, skipping...')
      continue
    hot.append((f, l))

  if hot:
    make_links(hot)

  vim_plugged_path: Path = VIM_PLUGGED_PATH[variant_index]
  if vim_plugged_path.exists():
    print(f'vim-plug already exists')
    exit(0)

  prompt(f'would you like to download vim-plug to {vim_plugged_path}? (y/N): ')
  try:
    os.makedirs(vim_plugged_path.parent)
  except OSError:
    print(f'directory {vim_plugged_path.parent} already exists')
  response = request.urlopen(VIM_PLUGGED_URL)
  data = response.read()
  with open(vim_plugged_path, 'wb') as f:
    f.write(data)
  print(f'successfully wrote to {vim_plugged_path}')

if __name__ == '__main__':
  main()