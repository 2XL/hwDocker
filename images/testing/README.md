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

** this approach is daunting job, require to built image over and over again, to run the tests.

...

** alternative approach to the previous, the Docker container is built with a runtime environment, the dev directory (test code) is mounted as a volume, and the test is performed inside the container.

1. same as previous but now we customize the python container with the required libraries until the test pass,
2. once the test pass, we perform a "sudo docker commit <instance_id> <newinstancename>"
3. from now on, we can use the new image to launch new containers for our TDD

### Integrating the Docker testing process into Jenkins (page 162)






```