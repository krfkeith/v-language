#include "cmdquote.h"
#include "vframe.h"
#include "vstack.h"
#include "quotestream.h"
#include "quoteiterator.h"
#include "vexception.h"

void CmdQuote::eval(VFrame* scope) {
    VStack* stack = scope->stack();
    TokenIterator* stream = _tokens->iterator();
    while(stream->hasNext()) {
        stack->push((Term*)stream->next());
        if (cando(stack))
            dofunction(scope);
    }
}
TokenStream* CmdQuote::tokens() {
    return _tokens;
}
CmdQuote::CmdQuote(TokenStream* tokens) {
    _tokens = tokens;
}
void CmdQuote::dofunction(VFrame* scope) {
    VStack* st = scope->stack();
    try {
        Term* sym = st->pop();
        if (sym->type()!= TSymbol)
            throw VException("err:not_symbol", "Not a symbol");
        Quote* q = scope->lookup(sym->svalue());
        if (!q)
            throw VException("err:undef_symbol", "Undefined Symbol");
        try {
            q->eval(scope->child());
        } catch (VException e) {
            throw VException("TODO", "cmdquote");
        }
    } catch (VException &e) {
        // TODO:
        throw e;
    }
}
bool CmdQuote::cando(VStack* stack) {
    if (stack->empty())
        return false;
    if (stack->peek()->type() == TSymbol)
        return true;
    return false;
}