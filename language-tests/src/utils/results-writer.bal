import ballerina/io;

const string RESULTS_PATH = "./results.csv";
string[][] results = [];

function addToResults(string testCaseName, int consumedTime) {
    string padding;
    if (testCaseName.length() < 16) {
        padding = "\t\t\t";
    } else if (testCaseName.length() < 22) {
        padding = "\t\t";
    } else {
        padding = "\t";
    }

    io:println("| ", testCaseName, padding, "| \t", consumedTime, "\t\t|");
    string[] result = [testCaseName, consumedTime.toString()];
    results.push(result);
}

function writeResults() {
    io:WritableCSVChannel csvChannel = checkpanic io:openWritableCsvFile(RESULTS_PATH);
    writeHeader(csvChannel);

    // write results
    foreach string[] entry in results {
        checkpanic csvChannel.write(entry);
    }

    // close the channel
    var result = csvChannel.close();
    if (result is error) {
        io:println("Error occurred while closing the channel: ", error);
    }
}

function writeHeader(io:WritableCSVChannel csvChannel) {
    string[] header = ["Test Case", "Consumed Time"];
    checkpanic csvChannel.write(header);
}
