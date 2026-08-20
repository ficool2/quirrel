#pragma once

namespace SQCompilation
{


class ModificationChecker : public Visitor
{
  bool result = false;
public:

  void visitNode(Node *n) override {
    TreeOp op = n->op();

    switch (op)
    {
    case TO_INC:
    case TO_ASSIGN:
    case TO_PLUSEQ:
    case TO_MINUSEQ:
    case TO_MULEQ:
    case TO_DIVEQ:
    case TO_MODEQ:
    case TO_OREQ:
    case TO_ANDEQ:
    case TO_XOREQ:
    case TO_SHLEQ:
    case TO_SHREQ:
    case TO_USHREQ:
      result = true;
      return;
    default:
      n->visitChildren(this);
      break;
    }
  }

  bool check(Node *n) {
    result = false;
    n->visit(this);
    return result;
  }
};

}
