from ipykernel.kernelbase import Kernel
import subprocess

class Hs4Jupyter(Kernel):
    # automate some of these in future
    implementation = 'GHC'
    implementation_version = '8.4'
    language = 'Haskell'
    language_version = '2010'
    language_info = {
        'name': 'Haskell',
        'mimetype': 'text/plain',
        'file_extension': '.hs',
    }
    banner = "GHC Haskell kernel for Jupyter notebook"
    
    # this is called by IPKernelApp.launch_instance. initialize the interpreter
    def __init__(self, **kwargs):
        Kernel.__init__(self, **kwargs)
        self._start_Haskell()

    def _start_Haskell(self):
        kernelpath = 'put path here' # use sys function etc
        self.kernelInstance = subprocess.Popen(kernelpath, bufsize=-1, executable=None, stdin=PIPE, 
                                       stdout=PIPE, stderr=PIPE, preexec_fn=None, 
                                       close_fds=True, shell=False, cwd=None, env=None, 
                                       universal_newlines=True, startupinfo=None, 
                                       creationflags=0, restore_signals=True, 
                                       start_new_session=False, pass_fds=(), *, 
                                       encoding=UTF-8, errors=None, text=None)

    def do_execute(self, code, silent, store_history=True, user_expressions=None,
                   allow_stdin=False):
        # run code using the PIPE
    	if not silent:
	    #code = str.rstrip(str.rstrip(code)) $ strip string of useless whitespace. (necessary?)
	    output = 'kernel stdout here'
	    # send the output to stdout
	    stream_content = {'name': 'stdout', 'text': output}
	    # send_response is used for printing to the stdio (notebook)
            self.send_response(self.iopub_socket, 'stream', stream_content)

        return {'status': 'ok',
                # The base class increments the execution count
                'execution_count': self.execution_count,
                'payload': [],
		# user_expressions is a python dictionary containing the 
		# results of the computation
                'user_expressions': {},
               }

    def do_shutdown(restart):
	    # orderly shutdown of the kernel
	    return

if __name__ == '__main__':
    from ipykernel.kernelapp import IPKernelApp
    IPKernelApp.launch_instance(kernel_class=Hs4Jupyter)