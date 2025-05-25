// Структура для проводника
struct Conductor {
    let name: String
    let specificResistance: Double // rho
    let crossSectionalArea: Double // S
    
    // Фактор сопротивления (rho/S), т.к. L=1
    var resistanceFactor: Double {
        if crossSectionalArea == 0 { return Double.greatestFiniteMagnitude }
        return specificResistance / crossSectionalArea
    }
}

let conductor1 = Conductor(name: "Проводник A", specificResistance: 1.7e-8, crossSectionalArea: 1.0e-6)
let conductor2 = Conductor(name: "Проводник B", specificResistance: 2.8e-8, crossSectionalArea: 1.5e-6)
let conductor3 = Conductor(name: "Проводник C", specificResistance: 1.0e-6, crossSectionalArea: 0.5e-6)

let conductors = [conductor1, conductor2, conductor3]
var winner: Conductor? = nil
var maxFactor = -1.0

print("--- Расчет факторов сопротивления (ρ/S) ---")
for conductor in conductors {
    print("\(conductor.name): ρ/S = \(conductor.resistanceFactor)")
    if conductor.resistanceFactor > maxFactor {
        maxFactor = conductor.resistanceFactor
        winner = conductor
    }
}

if let identifiedWinner = winner {
    print("\n--- Результат ---")
    print("Проводник с максимальным сопротивлением (при L=1м): \(identifiedWinner.name)")
    print("Его фактор сопротивления (ρ/S): \(identifiedWinner.resistanceFactor)")
} else {
    print("\nНе удалось определить победителя.")
}
