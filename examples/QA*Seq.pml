@startuml
actor KotlinApp as "Kotlin Application"
participant "Quantum Client (Azure)" as QC
participant "Azure Quantum Backend" as AQB
participant "Q# Quantum A* Algorithm" as QAstar
participant "Graph" as G
participant "Oracle (Path Evaluation)" as Oracle
participant "Quantum Registers (Path States)" as QR

KotlinApp -> QC : Submit Job (Graph, Start, Goal)
QC -> AQB : Submit Quantum Job (QuantumAStar)
AQB -> QAstar : Call QuantumAStar(graph, start, goal)
QAstar -> QR : Initialize Quantum Register (superposition of all paths)
QAstar -> QAstar : Apply Grover’s Algorithm (amplitude amplification)
QAstar -> Oracle : Check Path (oracle evaluates path)
Oracle -> QAstar : Return Optimal Path Evaluation
QAstar -> QR : Apply Diffusion Operator (amplitude inversion)
QAstar -> AQB : Return Result (Optimal Path)
AQB -> QC : Return Quantum Search Result
QC -> KotlinApp : Return Optimal Path (Quantum Amplified)

note over KotlinApp : Classical side manages graph\n and calls quantum job for amplification.
note over QAstar : Quantum side applies Grover's\n algorithm and oracle for path search.
note over Oracle : Evaluates paths using cost\n function and heuristics.

@enduml
