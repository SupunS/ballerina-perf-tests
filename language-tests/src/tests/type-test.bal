any a = 5;
function primitiveTypeTest() {
    boolean x = a is int;
}

function primitiveUnionTypeTest() {
    boolean x = a is string|boolean|()|int|float;
}
