x.R and x.py both import a function from y.{py,R} and call it.

These both work fine:

    cd cwd-import-example
    ./x.py
    ./x.R

But then...

    cd ..
    ./cwd-import-example/x.py # works fine
    ./cwd-import-example/x.R # error

This is particularly annoying if you want to use the script as a real program:

    cd cwd-import-example
    ln -s $PWD/x.py ~/bin/x.py
    ln -s $PWD/x.R ~/bin/x.R
    cd

    x.py # works fine
    x.R # error

There is a hacky workaround in `better.R`, but it can't be factored out into a
utility function script because the utility function script itself needs to
be imported.
