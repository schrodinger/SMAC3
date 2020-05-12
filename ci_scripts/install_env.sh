#!/usr/bin/env bash

python --version

if [[ "$PYTHON_VERSION" == "pypy_conda" ]]; then

    # pypy 7.3 works only with python 3.6
    wget $MINICONDA_URL -O miniconda.sh
    bash miniconda.sh -b -p $HOME/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"
    if [[ `which conda` ]]; then echo 'Conda installation successful'; else exit 1; fi
    conda config --add channels conda-forge
    conda config --set channel_priority strict
    conda create -n testenv --yes pypy pip wheel pytest gxx_linux-64 gcc_linux-64 swig>=4.0.1
    source activate testenv

else

    wget $MINICONDA_URL -O miniconda.sh
    bash miniconda.sh -b -p $HOME/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"
    if [[ `which conda` ]]; then echo 'Conda installation successful'; else exit 1; fi
    conda create -n testenv --yes python=$PYTHON_VERSION pip wheel pytest gxx_linux-64 gcc_linux-64 swig
    source activate testenv

fi
