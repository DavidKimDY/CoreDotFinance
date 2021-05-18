import re
import sys
from setuptools import setup

# Using numpy 1.20.0 requires python >= 3.7
if sys.version_info[:2] < (3, 7):
    raise ImportError("""
    This version of coredotfinance no supports python versions less than 3.7.0.
    """)


def find_version(fname):
    """Attempts to find the version number in the file names fname.
    Raises RuntimeError if not found.
    """
    version = ''
    with open(fname, 'r') as fp:
        reg = re.compile(r'__version__ = [\'"]([^\'"]*)[\'"]')
        for line in fp:
            m = reg.match(line)
            if m:
                version = m.group(1)
                break
    if not version:
        raise RuntimeError('Cannot find version information')
    return version


__version__ = find_version('coredotfinance/__init__.py')


def read(fname):
    with open(fname) as fp:
        content = fp.read()
    return content


REQUIREMENTS = [
    'requests>=2; python_version >= "3"',
    'requests>=2; python_version < "3"',
]

PACKAGES = [
    'coredotfinance',
    'coredotfinance.log',
    'coredotfinance.krx',
    'coredotfinance.krx.krx_website'
    'coredotfinance.crypto',
    'coredotfinance.crypto.binance'
]

INSTALL_REQUIRES = [
    'pandas >= 0.14',
    'numpy >= 1.8',
    'requests >= 2.7.0',
    'beautifulsoup4 >= 4.9.3'
    'plotly >= 4.14.3'
]

with open('README.rst') as f:
    LONG_DESCRIPTION = f.read()

KEYWORDS = [
    'finance',
    'stock',
    'money',
    'krx',
    'bitcoin',
    'cryptocurrency',
    'index'
]

setup(
    name='coredotfinance',
    version=__version__,
    packages=PACKAGES,
    url='https://github.com/coredottoday/CoreDotFinance',
    license='',
    author='Core.Today',
    author_email='help@core.today',
    description='Financial data on web',
    keywords=KEYWORDS,
    long_description=LONG_DESCRIPTION,
    install_requires=INSTALL_REQUIRES
)

