# ballerina-perf-tests

Contains performance test cases for the ballerina runtime, for different scenarios. These includes perf tests for: 
 - Create, get and set operations for ballerina records, maps, objects and arrays
 - Function invocations
 - Type tests
 
 
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

The results will be printed in the console, and will also be available in csv format (`results.csv`)
