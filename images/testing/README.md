#### Testing with Docker

```

### Test-Driven Development

* cyclic ordered stages: Write a Failing Test >> Make the Test Pass >> Refactor


sudo apt-get install python-unittest2 # 2 python 2.x || 3 python 3.x
# run test using unittest-python  
python -m unittest <test_hitcount|test_script>



### Testing your code inside Docker

* requirements: in real world one might work on multiple projects that might have conflicting libraries, and hence there is a need for the isolation of runtime environments.
* virtualenv was the previous approach to face this issues.
* docker goes one step further, isolating from os packaging level, the python toolchain and its runtime environment.



### Integrating the Docker testing process into Jenkins



```