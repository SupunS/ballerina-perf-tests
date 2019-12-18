import ballerina/io;
import ballerina/time;
import ballerinaperf/utils;

public function main() {
    io:println("Starting language perf tests...");
    io:println("---------------------------------------------------------");
    io:println("|\tOperation", "\t\t| ", "\tConsumed Time\t|");
    io:println("---------------------------------------------------------");
    time:Time startTime = time:currentTime();

    // Create
    utils:setIterations(20000000);
    utils:test(createRecord, "Create Record");
    utils:test(createObject, "Create Object");
    utils:test(createMap, "Create Map");
    utils:test(createArray, "Create Array");
    utils:test(createIntArray, "Create Primitive Array");

    // Get
    utils:test(recordGet, "Record get");
    utils:test(objectGet, "Object get");
    utils:test(mapGet, "Map get");
    utils:test(arrayGet, "Array get");
    utils:test(intArrayGet, "Primitive Array get");

    // Set
    utils:test(recordSet, "Record set");
    utils:test(objectSet, "Object set");
    utils:test(mapSet, "Map set");
    utils:test(arraySet, "Array set");
    utils:test(intArraySet, "Primitive Array set");


    // Function Calls
    utils:setIterations(200000000);
    utils:test(functionCall, "No returns function");
    utils:test(functionCall, "String returning function");
    utils:test(functionPointerCall, "Function Pointer Call");


    // Type Tests
    utils:setIterations(20000000);
    utils:test(primitiveTypeTest, "primitive type test");
    utils:test(primitiveUnionTypeTest, "primitive union type test");


    io:println("---------------------------------------------------------");
    utils:wrapupTestSuit(startTime);
}
