#
#  THIS DOES NOT WORK YET
#
import os, os.path, subprocess

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
        result = subprocess.run(['sparse-llvm', filename, '-o', bc_file], stdout=subprocess.DEVNULL,
                            stderr=subprocess.DEVNULL)
        #result = subprocess.run(['sparse-llvm', filename], stdout=f,
        #                    stderr=subprocess.DEVNULL)
        if result.returncode == 0:
            return True
    return False

def get_expected_output(filename):
    """
    Returns the expected output from a test as a string.
    The expected output for program.c is looked in program.expect.
    If no expected output is available returns None
    :param filename: The C source file name
    :return: Expected output after running the test
    """
    (basename, ext) = os.path.splitext(filename)
    expected_output_file = basename + '.expect'
    expected_output = None
    if os.path.isfile(expected_output_file):
        with open(expected_output_file) as f:
            expected_output = f.read()
    return expected_output

def execute_test(bc_file):
    """
    Executes the given LLVM bitcode file using lli
    and returns a tuple indicating whether the program
    terminated normally and any output from the program
    :param bc_file: The LLVM bitcode file to execute
    :return: Tuple pair - status and output
    """
    result = subprocess.run(['lli', bc_file], universal_newlines=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    if result.returncode != 0:
        return False, None
    return True, result.stdout


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
        print('Test ' + filename + ' FAILED to compile')
        return False
    (status, actual_output) = execute_test(bc_file)
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
    # We CD to the location where the sources are as some tests
    # include other files
    os.chdir(test_directory)
    print('Running tests in ' + test_directory)
    if os.path.isfile('main.c'):
        result = run_a_test(os.path.join(test_directory, 'main.c'), results_directory)
        if not result:
            return 1, 1
        else:
            return 1, 0
    if os.path.isfile('run.sh') and os.name == 'posix':
        result = run_external_test(test_directory)
        if not result:
            return 1, 1
        else:
            return 1, 0
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


current_directory = os.getcwd()

# The compiled output will be generated in test_results folder (out.bc)
temp_directory = os.path.join(current_directory, 'test_results')
if not os.path.isdir(temp_directory):
    os.mkdir(temp_directory)
print('Using folder [' + temp_directory + '] for test results')

with os.scandir(current_directory) as it:
    for entry in it:
        if entry.name == 'unsupported' or entry.name == 'bugs' or entry.name == 'nano':
            continue
        if entry.name == 'parsetree' or entry.name == 'sqlite':
            continue
        if not entry.name.startswith('.') and entry.is_dir():
            os.chdir(current_directory)
            run_tests(entry.path, temp_directory)
