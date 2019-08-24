import os, os.path, subprocess, shutil

def compile_a_test(filename, bc_file):
    """
    Compiles the given file using sparse-llvm and saves output to the
    bc_file; bc_file will be created
    :param filename: The C source file to be compiled
    :param bc_file: The file that will be generated after compilation
    :return: True on success
    """
    if os.path.isfile(bc_file):
        os.remove(bc_file)
    with open(bc_file, "wb") as f:
        result = subprocess.run([Sparse_Executable, filename, '-o', bc_file], stdout=subprocess.DEVNULL,
                            stderr=subprocess.DEVNULL)
        #result = subprocess.run([Sparse_Executable, filename], stdout=f,
        #                    stderr=subprocess.DEVNULL)
        if result.returncode == 0:
            return True
    return False

def get_expected_output(filename):
    """
    Returns the expected output from a test as a string.
    The expected output for program.c is looked in program.c.expect
    or program.expect.
    If no expected output is available returns None
    :param filename: The C source file name
    :return: Expected output after running the test
    """
    (basename, ext) = os.path.splitext(filename)
    expected_output_file = basename + '.expect' # legacy format
    expected_output = None
    if os.path.isfile(expected_output_file):
        with open(expected_output_file) as f:
            expected_output = f.read()
        return expected_output
    expected_output_file = filename + '.expect' # We should migrate to this format
    if os.path.isfile(expected_output_file):
        with open(expected_output_file) as f:
            expected_output = f.read()
    return expected_output

def get_expected_returncode(filename):
    """
    Reads expectrc file to determine what the expected
    return code is
    """
    expected_rc = 0
    expected_rc_file = filename + '.expectrc'
    if os.path.isfile(expected_rc_file):
        with open(expected_rc_file) as f:
            expected_rc = int(f.read())
    return expected_rc

def execute_test(bc_file, c_file):
    """
    Compiles and executes the given C source file 
    and returns a tuple indicating whether the program
    terminated normally and any output from the program
    :param bc_file: The LLVM bitcode file
    :param c_file: The C file
    :return: Tuple pair - status and output
    """
    try:
        expected_rc = get_expected_returncode(c_file)
        result = subprocess.run([LLVM_lli, bc_file], universal_newlines=True,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.DEVNULL)
        if result.returncode != 0 and result.returncode != expected_rc:
            print('Expected return code: {0}, got: {1}'.format(expected_rc, result.returncode))
            return False, None
        return True, result.stdout
    except Exception as err:
        print('Failed to run test: {0}: {1}'.format(c_file, err))
    except:
        print('Failed to run test: {0}: unexpected error: {1}'.format(c_file, sys.exc_info()[0]))
    return False, None 

def run_a_test(filename, results_directory):
    """
    Run a single test; the test will be compiled and then
    executed. Optionally its output will be compared with expected
    output. If test returns non zero code then it will be deemed
    to have faled
    :param filename: The C source file containing the test
    :param results_directory: The directory for writing output files
    :return: True if test passed else False
    """
    bc_file = os.path.join(results_directory, 'out.bc')
    if not compile_a_test(filename, bc_file):
        print('Test ' + filename + ' FAILED (compile error)')
        return False
    (status, actual_output) = execute_test(bc_file, filename)
    if not status:
        print('Test ' + filename + ' FAILED (non-zero code)')
        return False
    expected_output = get_expected_output(filename)
    if expected_output and expected_output != actual_output:
        print('Test ' + filename + ' FAILED (output mismatch)')
        print('Expected -->')
        print(expected_output)
        print('Actual -->')
        print(actual_output)
        return False
    print('Test ' + filename + ' OK')
    return True

def run_external_test(path):
    """
    Executes an external test by calling run.sh in the test directory.
    :param path: Path where the test lives
    :return: True if successful
    """
    my_directory = os.getcwd()
    os.chdir(path)
    result = subprocess.run(['/bin/bash', './run.sh'])
    os.chdir(my_directory)
    if result.returncode != 0:
        print('Test ' + path + ' FAILED')
        return False
    else:
        print('Test ' + path + ' OK')
    return True

def run_tests(test_directory, results_directory):
    """
    Runs tests in a sub-directory
    :param test_directory: The directory where the tests are
    :param results_directory: This is where any generated code will be put
    :return: A tuple (pair) indicating total tests run, and successes
    """
    # We change directory to the location where the sources are as some tests
    # include other files
    os.chdir(test_directory)
    print('Running tests in ' + test_directory)
    # If a test has a main.c defined then we ignore the
    # other files and simply run main.c
    if os.path.isfile('main.c'):
        result = run_a_test(os.path.join(test_directory, 'main.c'), results_directory)
        if not result:
            return 1, 0
        else:
            return 1, 1
    # If a test has run.sh present then we invoke that
    # and treat it as an external test
    # Only works on Unix like systems
    if os.path.isfile('run.sh'):
        if os.name == 'posix':
            result = run_external_test(test_directory)
            if not result:
                return 1, 0
            else:
                return 1, 1
        print('Skipping ' + test_directory + ' as this requires a POSIX environment')
        return 0, 0
    # Scan the sub-directories and run
    # tests within them
    count = 0
    successes = 0
    with os.scandir(test_directory) as it:
        for entry in it:
            if not entry.name.endswith('.c') or not entry.is_file():
                continue
            result = run_a_test(entry.path, results_directory)
            count = count + 1
            if result:
                successes = successes + 1
    return count, successes

Sparse_Executable = shutil.which('sparse-llvm', os.X_OK)
if not Sparse_Executable:
    print('sparse-llvm must be on the PATH')
    exit(1)

LLVM_lli = shutil.which('lli', os.X_OK)
LLVM_llc = shutil.which('llc', os.X_OK)
if not LLVM_lli or not LLVM_llc:
    print('LLVM binaries (lli, llc) must be on the PATH')
    exit(1)

print('Using [' + Sparse_Executable + ']')
print('Using [' + LLVM_lli + ']')

current_directory = os.getcwd()

# The compiled output will be generated in test_results folder (out.bc)
temp_directory = os.path.join(current_directory, '_test_results')
if not os.path.isdir(temp_directory):
    os.mkdir(temp_directory)
print('Using folder [' + temp_directory + '] for test results')

totals = 0
successes = 0

# FIXME these directories should be moved elsewhere
ignored_list = ['unsupported', 'bugs', 'nano', 'parsetree', 'sqlite', 'omrjit']

with os.scandir(current_directory) as it:
    for entry in it:
        if entry.name in ignored_list:
            continue
        if not entry.name.startswith('.') and not entry.name.startswith('_') and entry.is_dir():
            os.chdir(current_directory)
            (x, y) = run_tests(entry.path, temp_directory)
            totals = totals + x
            successes = successes + y

print('Total tests run ' + str(totals))
print('Successful tests ' + str(successes))
