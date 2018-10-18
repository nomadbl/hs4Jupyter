from ipykernel.kernelbase import Kernel
import subprocess

class Hs4Jupyter(Kernel):
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

    def do_execute(self, code, silent, store_history=True, user_expressions=None,
                   allow_stdin=False):
        if not silent:
	    stream_content = {'name': 'stdout', 'text': code}
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

if __name__ == '__main__':
    from ipykernel.kernelapp import IPKernelApp
    IPKernelApp.launch_instance(kernel_class=Hs4Jupyter)