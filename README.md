# ballerina-perf-tests

Contains performance test cases for the ballerina runtime, for different scenarios.
 - ballerina-values.bal - Perf tests for create, get and set operations for ballerina records, maps, objects and arrays
 
 
How to run:
-
Navigate inside the ballerina project `language-tests`

Build all the modules inside the project:
```
ballerina build -a
```

This will generate a runnable jar `target/bin/tests.jar`

Run the generated jar:
```
java -jar target/bin/tests.jar
```
