import json
import os
import sys

from smac.utils import dependencies
import skopt

__version__ = '0.12.3'
__author__ = 'Marius Lindauer, Matthias Feurer, Katharina Eggensperger, Joshua Marben, André Biedenkapp, Aaron Klein,'\
    'Stefan Falkner and Frank Hutter'


with open(os.path.join(os.path.dirname(__file__), 'requirements.txt')) as fh:
    dependencies.verify_packages(fh.read())

with open(os.path.join(os.path.dirname(__file__), 'extras_require.json')) as fh:
    extras_require = json.load(fh)

if sys.version_info < (3, 5, 2):
    raise ValueError("SMAC requires Python 3.5.2 or newer.")


if os.name != 'posix':
    print(
        'Detected unsupported operating system: %s. Please be aware, that SMAC might not run on this system.' %
        sys.platform
    )
