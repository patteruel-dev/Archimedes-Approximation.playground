import UIKit

var greeting = "Hello, playground"

struct Approximation {
    let greaterThan: Double
    let lessThan: Double
}

func calculate(internalDisections: Int = 1, externalDisections: Int = 1) -> Approximation {
    // by default, hexagon
    let internalR: Double = 1
    var internalLength = internalR // initially, the length would be = 1 for hexagon
    var internalSides = Double(6)
    // first calculation
    // internally, the radius is fixed to 1
    if internalDisections > 1 {
        for _ in 1..<internalDisections {
            let c_2 = pow(internalR, 2)
            let b_2 = pow(internalLength / 2, 2)
            let a_2 = c_2 - b_2
            let ap: Double = sqrt(a_2)
            let a2_2 = pow(internalR - ap, 2)
            let b2_2 = pow(internalLength / 2, 2)
            let c2_2 = a2_2 + b2_2
            let newL = sqrt(c2_2)
            internalLength = newL
            internalSides = internalSides * 2
            
            /*
             in a regular hexagon, radius is equal to the length, unit hexagon should be 1 on all sides
             in a regular unit hexagon, the apothem would be:
             r^2 = ap^2 + (s/2)^2
             1^2 = ap^2 + (1/2)^2
             ap^2 = 1 - 1/4
             ap^2 = 0.75
             sqrt(ap^2) = sqrt(0.75)
             ap = 0.866 (approx)
             */
            
            /*
             in a regular hexagon, radius is equal to the length, unit hexagon should be 1 on all sides
             if the polygon is split into dodecagon, with equal radius = 1,
             the length of the dodecagon would be the hypotenuse of the difference between the apothem of the hexagon and half the length of the sides of the hexagon;
             l^2 = (r - ap)^2 + (pl / 2)
             
             */
        }
    }
    
    // externally, the apothem is fixed to 1
    let externalA: Double = 1
    var externalLength = externalA * 2 // initially, the sides would be = 2 for square
    var externalSides = Double(4)
    // first calculation
    // internally, the radius is fixed to 1
    if externalDisections > 1 {
        for _ in 1..<externalDisections {
            let a_2 = pow(externalA, 2)
            let b_2 = pow(externalLength / 2, 2)
            let c_2 = a_2 + b_2
            let r: Double = sqrt(c_2)
            
            let a2_2 = pow(externalLength/3, 2)
            let b2_2 = pow(externalLength / 3, 2)
            let c2_2 = a2_2 + b2_2
            let newL = sqrt(c2_2)
            externalLength = newL
            externalSides = externalSides * 2
            
            /*
             in a square, apothem is equal to the length of sides, the square should be 2 on all sides
             in a square, the radius would be:
             r^2 = ap^2 + (s/2)^2
             r^2 = 1^2 + (2/2)^2
             r^2 = 1 + 1
             r^2 = 2
             sqrt(r^2) = sqrt(2)
             r = 1.414 (approx)
             */
            
            /*
             in a square, apothem is equal to the length of sides, the square should be 2 on all sides
             if the square is split into octagon, with equal apothem = 1,
             the length of the octagon would be the hypotenuse of the difference between the radius of the square and half the length of the sides of the hexagon;
             l^2 = (r - ap)^2 + (pl / 2)
             
             */
        }
    }
    
    print("Internal sides = \(internalSides)")
    print("Internal Side L = \(internalLength)")
    let internalPerimeter = internalLength * internalSides // ?
    let internalRatio = internalPerimeter / 2
    
    print("External sides = \(externalSides)")
    print("External Side L = \(externalLength)")
    let externalPerimeter = externalLength * externalSides
    let externalRatio = externalPerimeter / 2
    
    return Approximation(
        greaterThan: internalRatio,
        lessThan: externalRatio
    )
}

let result = calculate(internalDisections: 63, externalDisections: 5)
print("π <= \(result.lessThan)")
print("π >= \(result.greaterThan)")
