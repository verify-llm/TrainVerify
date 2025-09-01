# TrainVerify Dev Roadmap

This document outlines future work for the TrainVerify project. The roadmap is aspirational and subject to change as we gather feedback from the community.

## Short Term
- **Coverage of Symbolic Operators** — The currently supported symbolic operators cover only a small subset of PyTorch. We plan to extend support by (1) including more commonly used operators beyond those in LLMs, and (2) ensuring that each operator’s signature is seamlessly aligned with its official PyTorch counterpart.
- **Expressiveness of Symbolic Operators** — While symbolic operators are broadly expressive, they remain limited in handling certain cases: (1) value comparison (e.g. `max`, `argmax`), and (2) symbols used as table indices (e.g. `moe_gate`, `moe_expert`). Although TrainVerify currently employs workarounds to support pragmatic use cases, we aim to extend the component by exploring more math-supportive symbolic engines (see our [SymbArena](https://github.com/verify-llm/SymArena) repo), and by developing systematic methods to handle these challenging operators.


## Long Term
- **Generality Beyond nnScaler** — While the current TrainVerify implementation is built on [nnScaler](https://github.com/microsoft/nnscaler), its high-level design is not tied to any specific system. We aim to extend TrainVerify’s approach to other graph-based parallelization frameworks.
- **Automatic Operator Rewriting** — We aim to leverage program synthesis to reduce the manual effort required to rewrite symbolic forward and backward computations for custom operators.
- **Automatic Bug Fixing** — We aim to develop tools that automatically diagnose and repair parallelization bugs based on TrainVerify’s outputs.
