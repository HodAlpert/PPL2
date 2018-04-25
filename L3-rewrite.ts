import { filter, map, reduce, zip } from "ramda";
import { first, isArray, isBoolean, isEmpty, isNumber, isString, rest, second, isLetStarExp, makeLetExp, makeLetStarExp, LetStarExp, LetExp, makeProgram, makeDefineExp, isVarDecl, makeBinding, isBinding, isAtomicExp, Binding } from "./L3-ast";
import { AppExp, AtomicExp, BoolExp, CompoundExp, CExp, DefineExp, Exp, IfExp, LitExp, NumExp,
         Parsed, PrimOp, ProcExp, Program, StrExp, VarDecl, VarRef } from "./L3-ast";
import { allT, getErrorMessages, hasNoError, isError }  from "./L3-ast";
import { isAppExp, isBoolExp, isCExp, isDefineExp, isExp, isIfExp, isLetExp, isLitExp, isNumExp,
             isPrimOp, isProcExp, isProgram, isStrExp, isVarRef } from "./L3-ast";
import { makeAppExp, makeBoolExp, makeIfExp, makeLitExp, makeNumExp, makeProcExp, makeStrExp,
         makeVarDecl, makeVarRef } from "./L3-ast";
import { parseL3 } from "./L3-ast";
import { isClosure, isCompoundSExp, isEmptySExp, isSymbolSExp, isSExp,
         makeClosure, makeCompoundSExp, makeEmptySExp, makeSymbolSExp,
         Closure, CompoundSExp, SExp, Value } from "./value";

export const rewriteLetStar = (cexp: Parsed | Error) : LetExp  | Error => 
{
    const helper = (bindings: Binding[],internalBody: CExp[]):LetExp  | Error=>{
        return <LetExp>{bindings:[first(bindings)],body:(bindings.length==0)? internalBody:helper(rest(bindings),internalBody) }
    }
    return isLetStarExp(cexp)?helper(cexp.bindings,cexp.body): Error(`Bad procedure ${JSON.stringify(cexp)}`);
    
}
console.log(JSON.stringify(parseL3("(let* ((x 3) (y x)) x y)"), null, 4));
// export const rewriteAllLetStar = (cexp: Parsed | Binding | Error) : Parsed | Binding | Error =>
// {
// 	// Implement me!
// }
