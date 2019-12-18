import ballerina/io;
import ballerina/time;

int n = 20000000;

public function setIterations(int iterations) {
    n = iterations;
}

public function test(function() testFunc, string testCase) {
    _ = run(testFunc); // warmup

    int i = 0;
    int rounds = 5;
    int timeConsumed = 0;
    while (i < rounds) {
        timeConsumed += run(testFunc);
        i += 1;
    }

    int avgTime = timeConsumed/rounds;
    addToResults(testCase, avgTime);
}

function run(function() testFunc) returns int {
    int i = 0;
    int x = 0;
    var startTime = time:currentTime();

    while (i < n) {
        testFunc();
        i += 1;
    }

    var endTime = time:currentTime();
    return endTime.time - startTime.time;
}

public function wrapupTestSuit(time:Time startTime) {
    writeResults();
    time:Time endTime = time:currentTime();
    int seconds = (endTime.time - startTime.time)/1000;
    if (seconds < 60) {
        io:println("\nTests completed in ", seconds, "s.");
    } else {
        io:println("\nTests completed in ", seconds/60, "m ", seconds%60, "s.");
    }
}
