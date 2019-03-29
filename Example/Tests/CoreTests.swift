// https://github.com/Quick/Quick

import Quick
import Nimble
import GVKit

class CoreSpec: QuickSpec {
    override func spec() {
        
        describe("minmax") {
            it("increases the value to match min value") {
                expect(minmax(-2, min: 0, max: 10)).to(equal(0))
            }
            it("decreases the value to match max value") {
                expect(minmax(20, min: 0, max: 10)).to(equal(10))
            }
            it("doesnt change the value") {
                expect(minmax(5, min: 0, max: 10)).to(equal(5))
            }
        }
        
        describe("operations") {
            context("Double divided by Int") {
                it("works") {
                    let double: Double = 10
                    let int: Int = 2
                    expect(double/int).to(equal(5))
                }
            }
            context("Float divided by Int") {
                it("works") {
                    let float: Float = 10
                    let int: Int = 2
                    expect(float/int).to(equal(5))
                }
            }
            context("Double multiplied by Int") {
                it("works") {
                    let double: Double = 10
                    let int: Int = 2
                    expect(double * int).to(equal(20))
                }
            }
            context("Float multiplied by Int") {
                it("works") {
                    let float: Float = 10
                    let int: Int = 2
                    expect(float * int).to(equal(20))
                }
            }
            context("Float multiplied by Double") {
                it("works") {
                    let float: Float = 10
                    let double: Double = 2
                    expect(float * double).to(equal(20))
                }
            }
            context("Double multiplied by Float") {
                it("works") {
                    let double: Double = 10
                    let float: Float = 2
                    expect(double * float).to(equal(20))
                }
            }
        }
        
    }
}
