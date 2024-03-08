import os

from collections import namedtuple
from pathlib import Path
from sys import exit, platform

PathVariant = namedtuple('PathVariant', ['file_path', 'nix', 'win'])

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
    f = Path(link[0]).resolve()
    l = link[variant_index]
    if not l:
      print(f'no {platform} variant for {f}, skipping...')
      continue
    if l.exists():
      print(f'{l} already exists, skipping...')
      continue
    hot.append((f, l))
  if not hot:
    print('nothing to do, exiting...')
    exit(0)
  print('will create the following hard links:')
  for f, l in hot:
    print(f'{l} --> {f}')
  print('ok to continue? (y/N): ', end='')
  ans = input('')
  if not ans.lower().startswith('y'):
    print('exiting...')
    exit(1)
  for f, l in hot:
    os.link(f, l)
  print(f'{len(hot)} link{"s" if len(hot) > 1 else ""} created.')


if __name__ == '__main__':
  main()
