"use strict";
exports.__esModule = true;
var L3_ast_1 = require("./L3-ast");
var L3_ast_2 = require("./L3-ast");
exports.rewriteLetStar = function (cexp) {
    var helper = function (bindings, internalBody) {
        return { bindings: [L3_ast_1.first(bindings)], body: (bindings.length == 0) ? internalBody : helper(L3_ast_1.rest(bindings), internalBody) };
    };
    return L3_ast_1.isLetStarExp(cexp) ? helper(cexp.bindings, cexp.body) : Error("Bad procedure " + JSON.stringify(cexp));
};
console.log(JSON.stringify(L3_ast_2.parseL3("(let* ((x 3) (y x)) x y)"), null, 4));
// export const rewriteAllLetStar = (cexp: Parsed | Binding | Error) : Parsed | Binding | Error =>
// {
// 	// Implement me!
// }
