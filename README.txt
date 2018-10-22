Haskell GHC kernel for jupyter notebook

Installation
--------------
unpack and run "python setup.py" in shell/cmd

Information
--------------

The implementation is based on the IPython kernel machinery as described in https://jupyter-client.readthedocs.io/en/latest/wrapperkernels.html

The Haskell kernel is contained in a .so (*nix)/.dll(win32) which is called into by python using the FFI defined by https://github.com/nh2/call-haskell-from-anything#usage

The linking data type is MessagePack serialization https://msgpack.org/

-----------------------------------------------------------------

another implementation strategy using executable (no .so/.dll) and easier stdout/in/err redirection. Spawn the Haskell interpreter as a child process using
https://docs.python.org/3.7/library/subprocess.html
 -> use Popen objects to run and interact with the interpreter child process,
redirecting stdin/out/err=PIPE (to the father python process). Also better variable encapsulation (?).

The implementation is based on the IPython kernel machinery as described in https://jupyter-client.readthedocs.io/en/latest/wrapperkernels.html

data is transferred between the processes using the FFI (serialization) defined by https://github.com/nh2/call-haskell-from-anything#usage

The linking data type is MessagePack serialization https://msgpack.org/
(the intial implementation will be more basic, with no serialization and supporting only string input/output)

references:
https://brandonwamboldt.ca/how-linux-pipes-work-under-the-hood-1518/